from ovos_stt_plugin_nemo import NemoSTT
from ovos_config import Configuration

config = Configuration().get("stt", {}).get("ovos-stt-plugin-nemo", {})
plugin = NemoSTT(config=config)