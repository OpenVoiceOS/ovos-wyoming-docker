ARG TAG=latest
FROM jarbasai/ovos-wyoming-base:${TAG}

ARG BUILD_DATE=unknown
ARG VERSION=unknown

ARG ALPHA=true
ARG USER=ovos

SHELL ["/bin/bash", "-c"]

WORKDIR /home/${USER}

USER root

RUN apt-get update \
    && apt-get install -y automake libtool \
    && git clone https://github.com/espeak-ng/espeak-ng.git /tmp/espeak-ng \
    && cd /tmp/espeak-ng \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && mkdir -p /home/${USER}/.local/share/OpenVoiceOS \
    && chown ${USER}:${USER} -R /home/${USER} \
    && apt-get --purge autoremove -y \
    && apt-get clean \
    && rm -rf /home/${USER}/.cache/pip /var/lib/apt /var/log/{apt,dpkg.log} /tmp/espeak-ng

USER $USER

ENV PATH /home/${USER}/.venv/bin:$PATH
ENV VIRTUAL_ENV /home/${USER}/.venv

RUN pip3 install /opt/wyoming/wyoming-ovos-tts

RUN pip3 install aiohttp \
  && if [ "${ALPHA}" == "true" ]; then \
  pip3 install SpeechRecognition git+https://github.com/OpenVoiceOS/ovos-tts-plugin-matxa-multispeaker-cat --pre; \
  else \
  pip3 install SpeechRecognition git+https://github.com/OpenVoiceOS/ovos-tts-plugin-matxa-multispeaker-cat; \
  fi \
  && rm -rf ${HOME}/.cache


ENTRYPOINT wyoming-ovos-tts --uri tcp://0.0.0.0:8080 --plugin-name ovos-tts-plugin-matxa-multispeaker-cat

EXPOSE 8080
