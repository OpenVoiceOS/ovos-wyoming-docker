ARG TAG=latest
FROM jarbasai/ovos-wyoming-base:${TAG}

ARG BUILD_DATE=unknown
ARG VERSION=unknown

ARG ALPHA=true
ARG USER=ovos

SHELL ["/bin/bash", "-c"]

USER root

RUN apt-get update \
    && apt-get install -y ffmpeg \
    && apt-get --purge autoremove -y \
    && apt-get clean \
    && rm -rf /home/${USER}/.cache/pip /var/lib/apt /var/log/{apt,dpkg.log} /tmp/espeak-ng

USER $USER

WORKDIR /home/${USER}

RUN pip3 install /opt/wyoming/wyoming-ovos-stt

RUN pip3 install aiohttp \
  && if [ "${ALPHA}" == "true" ]; then \
  pip3 install SpeechRecognition ovos-stt-plugin-nemo --pre; \
  else \
  pip3 install SpeechRecognition ovos-stt-plugin-nemo ; \
  fi \
  && rm -rf ${HOME}/.cache

USER $USER

ENV PATH /home/${USER}/.venv/bin:$PATH
ENV VIRTUAL_ENV /home/${USER}/.venv

ENTRYPOINT wyoming-ovos-stt --uri tcp://0.0.0.0:8080 --debug --plugin-name ovos-stt-plugin-nemo

EXPOSE 8080
