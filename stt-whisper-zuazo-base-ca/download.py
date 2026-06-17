from ovos_stt_plugin_whisper import WhisperSTT
from ovos_config import Configuration

config = Configuration().get("stt", {}).get("ovos-stt-plugin-whisper", {})
plugin = WhisperSTT(config=config)