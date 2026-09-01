docker build -f base/Dockerfile.rocm -t jarbasai/ovos-wyoming-base-rocm:latest ./base

docker build -f stt-whisper/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-rocm:latest ./stt-whisper
docker build -f stt-whisper-turbo/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-turbo-rocm:latest ./stt-whisper-turbo
#docker build -f stt-whisper-tiny/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-tiny-rocmlatest ./stt-whisper-tiny
#docker build -f stt-whisper-small/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-small-rocmlatest ./stt-whisper-small
#docker build -f stt-whisper-medium/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-medium-rocmlatest ./stt-whisper-medium
#docker build -f stt-whisper-large/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-large-rocmlatest ./stt-whisper-large

#docker build -f stt-mynorthai-large/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-mynorthai-large-rocmlatest ./stt-mynorthai-large
#docker build -f stt-mynorthai-medium/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-mynorthai-medium-rocmlatest ./stt-mynorthai-medium
docker build -f stt-mynorthai-small/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-mynorthai-small-rocmlatest ./stt-mynorthai-small

docker build -f stt-whisper-zuazo-tiny-es/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-es-rocmlatest ./stt-whisper-zuazo-tiny-es
#docker build -f stt-whisper-zuazo-small-es/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-es-rocmlatest ./stt-whisper-zuazo-small-es
#docker build -f stt-whisper-zuazo-medium-es/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-es-rocmlatest ./stt-whisper-zuazo-medium-es
#docker build -f stt-whisper-zuazo-large-es/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-es-rocmlatest ./stt-whisper-zuazo-large-es
#docker build -f stt-whisper-zuazo-base-es/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-es-rocmlatest ./stt-whisper-zuazo-base-es

docker build -f stt-whisper-zuazo-tiny-eu/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-eu-rocmlatest ./stt-whisper-zuazo-tiny-eu
#docker build -f stt-whisper-zuazo-small-eu/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-eu-rocmlatest ./stt-whisper-zuazo-small-eu
#docker build -f stt-whisper-zuazo-medium-eu/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-eu-rocmlatest ./stt-whisper-zuazo-medium-eu
#docker build -f stt-whisper-zuazo-large-eu/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-eu-rocmlatest ./stt-whisper-zuazo-large-eu
#docker build -f stt-whisper-zuazo-base-eu/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-eu-rocmlatest ./stt-whisper-zuazo-base-eu

docker build -f stt-whisper-zuazo-tiny-gl/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-gl-rocmlatest ./stt-whisper-zuazo-tiny-gl
#docker build -f stt-whisper-zuazo-small-gl/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-gl-rocmlatest ./stt-whisper-zuazo-small-gl
#docker build -f stt-whisper-zuazo-medium-gl/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-gl-rocmlatest ./stt-whisper-zuazo-medium-gl
#docker build -f stt-whisper-zuazo-large-gl/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-gl-rocmlatest ./stt-whisper-zuazo-large-gl
#docker build -f stt-whisper-zuazo-base-gl/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-gl-rocmlatest ./stt-whisper-zuazo-base-gl

docker build -f stt-whisper-zuazo-tiny-ca/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-tiny-ca-rocmlatest ./stt-whisper-zuazo-tiny-ca
#docker build -f stt-whisper-zuazo-small-ca/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-small-ca-rocmlatest ./stt-whisper-zuazo-small-ca
#docker build -f stt-whisper-zuazo-medium-ca/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-medium-ca-rocmlatest ./stt-whisper-zuazo-medium-ca
#docker build -f stt-whisper-zuazo-large-ca/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-large-ca-rocmlatest ./stt-whisper-zuazo-large-ca
#docker build -f stt-whisper-zuazo-base-ca/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-zuazo-base-ca-rocmlatest ./stt-whisper-zuazo-base-ca

docker build -f stt-whisper-aina/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-whisper-aina-rocmlatest ./stt-whisper-aina

docker build -f stt-nemo/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-nemo-rocmlatest ./stt-nemo
docker build -f stt-hitz/Dockerfile.rocm -t jarbasai/ovos-wyoming-stt-hitz-rocmlatest ./stt-hitz
