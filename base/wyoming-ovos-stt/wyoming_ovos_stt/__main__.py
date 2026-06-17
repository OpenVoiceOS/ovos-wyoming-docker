#!/usr/bin/env python3
import argparse
import asyncio
import logging
from functools import partial

from ovos_config import Configuration
from ovos_plugin_manager.stt import OVOSSTTFactory
from wyoming.info import AsrModel, AsrProgram, Attribution, Info
from wyoming.server import AsyncServer

from wyoming_ovos_stt.handler import STTAPIEventHandler

_LOGGER = logging.getLogger(__name__)

__version__ = "0.0.1"

async def main() -> None:
    """Main entry point."""
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--plugin-name",
        required=True,
        help="OVOS STT plugin to load, corresponds to what you would put under \"module\" in mycroft.conf",
    )
    parser.add_argument("--uri", required=True, help="unix:// or tcp://")
    parser.add_argument("--debug", action="store_true", help="Log DEBUG messages")
    parser.add_argument(
        "--log-format", default=logging.BASIC_FORMAT, help="Format for log messages"
    )
    parser.add_argument(
        "--version",
        action="version",
        version=__version__,
        help="Print version and exit",
    )
    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.debug else logging.INFO, format=args.log_format
    )
    _LOGGER.debug(args)

    cfg = Configuration().get("stt", {}).get(args.plugin_name, {})

    stt = OVOSSTTFactory.create({"module": args.plugin_name,
                                 args.plugin_name: cfg})
    if "lang" in cfg: # single language plugin
        lang = cfg.get("lang")
        languages = [lang]
    else:
        languages = list(stt.available_languages or [Configuration().get("lang")])

    wyoming_info = Info(
        asr=[
            AsrProgram(
                name=args.plugin_name,
                description="STT transcription via OpenVoiceOS plugins",
                attribution=Attribution(
                    name="TigreGótico",
                    url="https://github.com/TigreGotico"
                ),
                installed=True,
                version=__version__,
                models=[
                    AsrModel(
                        name=args.plugin_name,
                        description=f"OVOS STT Plugin: {args.plugin_name}",
                        attribution=Attribution(
                            name="OpenVoiceOS",
                            url="https://github.com/OpenVoiceOS/ovos-plugin-manager"
                        ),
                        installed=True,
                        languages=languages,
                        version="1.0",
                    )
                ],
            )
        ],
    )

    # Load converted whisper API

    server = AsyncServer.from_uri(args.uri)
    _LOGGER.info("Ready")
    model_lock = asyncio.Lock()
    await server.run(
        partial(
            STTAPIEventHandler,
            wyoming_info,
            stt
        )
    )


# -----------------------------------------------------------------------------


def run() -> None:
    asyncio.run(main(), debug=True)


if __name__ == "__main__":
    try:
        run()
    except KeyboardInterrupt:
        pass
