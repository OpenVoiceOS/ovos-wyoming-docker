from ovos_stt_plugin_citrinet import CitrinetSTT
from ovos_config import Configuration

config = Configuration().get("stt", {}).get("ovos-stt-plugin-citrinet", {})
plugin = CitrinetSTT(config=config)