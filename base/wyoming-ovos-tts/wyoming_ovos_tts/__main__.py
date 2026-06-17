#!/usr/bin/env python3
import argparse
import asyncio
import io
import logging
import time
import wave
from functools import partial
from pathlib import Path

from ovos_config import Configuration
from ovos_plugin_manager.templates.tts import TTS
from ovos_plugin_manager.tts import OVOSTTSFactory
from wyoming.audio import wav_to_chunks
from wyoming.event import Event
from wyoming.info import Attribution, Describe, Info, TtsProgram, TtsVoice
from wyoming.server import AsyncEventHandler, AsyncServer
from wyoming.tts import Synthesize

_LOGGER = logging.getLogger()
_DIR = Path(__file__).parent

_SAMPLES_PER_CHUNK = 1024


async def main() -> None:
    """Main entry point."""
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--plugin-name",
        required=True,
        help="OVOS TTS plugin to load, corresponds to what you would put under \"module\" in mycroft.conf",
    )
    parser.add_argument("--uri", default="stdio://", help="unix:// or tcp://")

    parser.add_argument("--debug", action="store_true", help="Log DEBUG messages")
    args = parser.parse_args()

    logging.basicConfig(level=logging.DEBUG if args.debug else logging.INFO)
    _LOGGER.debug(args)

    cfg = Configuration().get("tts", {}).get(args.plugin_name, {})
    lang = cfg.get("lang") or Configuration().get("lang")
    tts = OVOSTTSFactory.create({"module": args.plugin_name,
                                 args.plugin_name: cfg})
    languages = list(tts.available_languages or [lang])

    wyoming_info = Info(
        tts=[
            TtsProgram(
                name=args.plugin_name,
                description="TTS synth via OpenVoiceOS plugins",
                attribution=Attribution(
                    name="TigreGótico",
                    url="https://github.com/TigreGotico"
                ),
                installed=True,
                version="1.0.0",
                voices=[
                    TtsVoice(
                        name=f"{tts.voice or tts.lang or args.plugin_name}",
                        description=f"OVOS TTS Plugin: {args.plugin_name}",
                        attribution=Attribution(
                            name="OpenVoiceOS",
                            url="https://github.com/OpenVoiceOS/ovos-plugin-manager"
                        ),
                        installed=True,
                        languages=languages,
                        version=None,
                    )
                ],
            )
        ],
    )

    _LOGGER.info("Ready")

    # Start server
    server = AsyncServer.from_uri(args.uri)

    try:
        await server.run(
            partial(
                OVOSTTSEventHandler,
                wyoming_info,
                args,
                tts,
            )
        )
    except KeyboardInterrupt:
        pass


# -----------------------------------------------------------------------------

class OVOSTTSEventHandler(AsyncEventHandler):
    """Event handler for clients."""

    def __init__(
            self,
            wyoming_info: Info,
            cli_args: argparse.Namespace,
            plugin: TTS,
            *args,
            **kwargs,
    ) -> None:
        super().__init__(*args, **kwargs)

        self.cli_args = cli_args
        self.wyoming_info_event = wyoming_info.event()
        self.client_id = str(time.monotonic_ns())
        self.tts = plugin

        _LOGGER.debug("Client connected: %s", self.client_id)

    async def handle_synth(self, synth_params: Synthesize) -> bytes:
        _LOGGER.debug(synth_params)
        audio_path, _ = self.tts.synth(synth_params.text)
        with open(str(audio_path.path), "rb") as audio_file:
            wav_bytes = audio_file.read()
        return wav_bytes

    async def handle_event(self, event: Event) -> bool:
        if Describe.is_type(event.type):
            await self.write_event(self.wyoming_info_event)
            _LOGGER.debug("Sent info to client: %s", self.client_id)
            return True

        if Synthesize.is_type(event.type):
            wav_bytes = await self.handle_synth(Synthesize.from_event(event))
            _LOGGER.debug("Got %s byte(s) of WAV data", len(wav_bytes))
            with io.BytesIO(wav_bytes) as wav_io:
                wav_file: wave.Wave_read = wave.open(wav_io, "rb")
                for wav_event in wav_to_chunks(
                        wav_file,
                        samples_per_chunk=_SAMPLES_PER_CHUNK,
                        start_event=True,
                        stop_event=True,
                ):
                    await self.write_event(wav_event.event())
        else:
            _LOGGER.debug("Unexpected event: type=%s, data=%s", event.type, event.data)

        return True

    async def disconnect(self) -> None:
        _LOGGER.debug("Client disconnected: %s", self.client_id)


# -----------------------------------------------------------------------------

def run():
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        pass

if __name__ == "__main__":
    run()
