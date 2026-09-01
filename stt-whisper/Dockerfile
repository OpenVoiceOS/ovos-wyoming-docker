ARG TAG=latest
FROM jarbasai/ovos-wyoming-base:${TAG}

ARG BUILD_DATE=unknown
ARG VERSION=unknown

ARG ALPHA=true
ARG USER=ovos

SHELL ["/bin/bash", "-c"]

WORKDIR /home/${USER}

COPY cpu.conf /etc/mycroft/mycroft.conf

RUN pip3 install /opt/wyoming/wyoming-ovos-stt

RUN pip3 install aiohttp \
  && if [ "${ALPHA}" == "true" ]; then \
  pip3 install SpeechRecognition ovos-stt-plugin-whisper torch --pre; \
  else \
  pip3 install SpeechRecognition ovos-stt-plugin-whisper torch ; \
  fi \
  && rm -rf ${HOME}/.cache

USER $USER

ENV PATH /home/${USER}/.venv/bin:$PATH
ENV VIRTUAL_ENV /home/${USER}/.venv

ENTRYPOINT wyoming-ovos-stt --uri tcp://0.0.0.0:8080 --debug --plugin-name ovos-stt-plugin-whisper

EXPOSE 8080
