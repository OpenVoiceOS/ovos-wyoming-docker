ARG TAG=latest
FROM jarbasai/ovos-wyoming-base:${TAG}

ARG BUILD_DATE=unknown
ARG VERSION=unknown

ARG ALPHA=true
ARG USER=ovos

SHELL ["/bin/bash", "-c"]

WORKDIR /home/${USER}

RUN pip3 install /opt/wyoming/wyoming-ovos-stt

RUN pip3 install aiohttp \
  && if [ "${ALPHA}" == "true" ]; then \
  pip3 install SpeechRecognition git+https://github.com/OpenVoiceOS/ovos-stt-plugin-citrinet --pre; \
  else \
  pip3 install SpeechRecognition ovos-stt-plugin-citrinet; \
  fi \
  && rm -rf ${HOME}/.cache

USER $USER

ENV PATH /home/${USER}/.venv/bin:$PATH
ENV VIRTUAL_ENV /home/${USER}/.venv

ENTRYPOINT wyoming-ovos-stt --uri tcp://0.0.0.0:8080 --debug --plugin-name ovos-stt-plugin-citrinet

EXPOSE 8080
