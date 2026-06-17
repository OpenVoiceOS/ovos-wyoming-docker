docker build -f base/Dockerfile -t jarbasai/ovos-wyoming-base:latest ./base

docker build -f tts-servers/Dockerfile -t jarbasai/ovos-wyoming-tts-servers:latest ./tts-servers
docker build -f tts-matxa/Dockerfile -t jarbasai/ovos-wyoming-tts-matxa:latest ./tts-matxa
docker build -f tts-google-tx/Dockerfile -t jarbasai/ovos-wyoming-tts-google-tx:latest ./tts-google-tx
docker build -f tts-mimic/Dockerfile -t jarbasai/ovos-wyoming-tts-mimic:latest ./tts-mimic
docker build -f tts-sam/Dockerfile -t jarbasai/ovos-wyoming-tts-sam:latest ./tts-sam

docker build -f tts-nos/Dockerfile -t jarbasai/ovos-wyoming-tts-nos:latest ./tts-nos

docker build -f ww/Dockerfile -t jarbasai/ovos-wyoming-wakewords:latest ./ww


docker build -f stt-chromium/Dockerfile -t jarbasai/ovos-wyoming-chromium:latest ./stt-chromium
docker build -f stt-servers/Dockerfile -t jarbasai/ovos-wyoming-stt-servers:latest ./stt-servers

docker build -f stt-citrinet/Dockerfile -t jarbasai/ovos-wyoming-citrinet:latest ./stt-citrinet
#docker build -f stt-citrinet-ca/Dockerfile -t jarbasai/ovos-wyoming-citrinet-ca:latest ./stt-citrinet-ca
docker build -f stt-citrinet-de/Dockerfile -t jarbasai/ovos-wyoming-citrinet-de:latest ./stt-citrinet-de
docker build -f stt-citrinet-en/Dockerfile -t jarbasai/ovos-wyoming-citrinet-en:latest ./stt-citrinet-en
docker build -f stt-citrinet-es/Dockerfile -t jarbasai/ovos-wyoming-citrinet-es:latest ./stt-citrinet-es
docker build -f stt-citrinet-fr/Dockerfile -t jarbasai/ovos-wyoming-citrinet-fr:latest ./stt-citrinet-fr
docker build -f stt-citrinet-it/Dockerfile -t jarbasai/ovos-wyoming-citrinet-it:latest ./stt-citrinet-it
docker build -f stt-citrinet-nl/Dockerfile -t jarbasai/ovos-wyoming-citrinet-nl:latest ./stt-citrinet-nl
docker build -f stt-citrinet-pt/Dockerfile -t jarbasai/ovos-wyoming-citrinet-pt:latest ./stt-citrinet-pt
docker build -f stt-citrinet-uk/Dockerfile -t jarbasai/ovos-wyoming-citrinet-uk:latest ./stt-citrinet-uk

docker build -f stt-whisper/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper:latest ./stt-whisper
docker build -f stt-whisper-turbo/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-turbo:latest ./stt-whisper-turbo
#docker build -f stt-whisper-tiny/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-tiny:latest ./stt-whisper-tiny
#docker build -f stt-whisper-small/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-small:latest ./stt-whisper-small
#docker build -f stt-whisper-medium/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-medium:latest ./stt-whisper-medium
#docker build -f stt-whisper-large/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-large:latest ./stt-whisper-large
#docker build -f stt-whisper-base/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-base:latest ./stt-whisper-base

#docker build -f stt-mynorthai-large/Dockerfile -t jarbasai/ovos-wyoming-stt-mynorthai-large:latest ./stt-mynorthai-large
#docker build -f stt-mynorthai-medium/Dockerfile -t jarbasai/ovos-wyoming-stt-mynorthai-medium:latest ./stt-mynorthai-medium
docker build -f stt-mynorthai-small/Dockerfile -t jarbasai/ovos-wyoming-stt-mynorthai-small:latest ./stt-mynorthai-small

docker build -f stt-whisper-zuazo-tiny-es/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-es:latest ./stt-whisper-zuazo-tiny-es
#docker build -f stt-whisper-zuazo-small-es/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-es:latest ./stt-whisper-zuazo-small-es
#docker build -f stt-whisper-zuazo-medium-es/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-es:latest ./stt-whisper-zuazo-medium-es
#docker build -f stt-whisper-zuazo-large-es/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-es:latest ./stt-whisper-zuazo-large-es
#docker build -f stt-whisper-zuazo-base-es/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-es:latest ./stt-whisper-zuazo-base-es

docker build -f stt-whisper-zuazo-tiny-eu/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-eu:latest ./stt-whisper-zuazo-tiny-eu
#docker build -f stt-whisper-zuazo-small-eu/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-eu:latest ./stt-whisper-zuazo-small-eu
#docker build -f stt-whisper-zuazo-medium-eu/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-eu:latest ./stt-whisper-zuazo-medium-eu
#docker build -f stt-whisper-zuazo-large-eu/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-eu:latest ./stt-whisper-zuazo-large-eu
#docker build -f stt-whisper-zuazo-base-eu/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-eu:latest ./stt-whisper-zuazo-base-eu

docker build -f stt-whisper-zuazo-tiny-gl/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-gl:latest ./stt-whisper-zuazo-tiny-gl
#docker build -f stt-whisper-zuazo-small-gl/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-gl:latest ./stt-whisper-zuazo-small-gl
#docker build -f stt-whisper-zuazo-medium-gl/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-gl:latest ./stt-whisper-zuazo-medium-gl
#docker build -f stt-whisper-zuazo-large-gl/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-gl:latest ./stt-whisper-zuazo-large-gl
#docker build -f stt-whisper-zuazo-base-gl/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-gl:latest ./stt-whisper-zuazo-base-gl

docker build -f stt-whisper-zuazo-tiny-ca/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-ca:latest ./stt-whisper-zuazo-tiny-ca
#docker build -f stt-whisper-zuazo-small-ca/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-ca:latest ./stt-whisper-zuazo-small-ca
#docker build -f stt-whisper-zuazo-medium-ca/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-ca:latest ./stt-whisper-zuazo-medium-ca
#docker build -f stt-whisper-zuazo-large-ca/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-ca:latest ./stt-whisper-zuazo-large-ca
#docker build -f stt-whisper-zuazo-base-ca/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-ca:latest ./stt-whisper-zuazo-base-ca

docker build -f stt-whisper-aina/Dockerfile -t jarbasai/ovos-wyoming-stt-whisper-aina:latest ./stt-whisper-aina

docker build -f stt-nemo/Dockerfile -t jarbasai/ovos-wyoming-stt-nemo:latest ./stt-nemo
docker build -f stt-hitz/Dockerfile -t jarbasai/ovos-wyoming-stt-hitz:latest ./stt-hitz

