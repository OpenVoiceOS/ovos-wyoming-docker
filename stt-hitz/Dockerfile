ARG TAG=latest
FROM jarbasai/ovos-wyoming-stt-nemo:${TAG}

ARG BUILD_DATE=unknown
ARG VERSION=unknown

ARG ALPHA=true
ARG USER=ovos

SHELL ["/bin/bash", "-c"]

WORKDIR /home/${USER}

COPY cpu.conf /etc/mycroft/mycroft.conf

USER $USER

ENV PATH /home/${USER}/.venv/bin:$PATH
ENV VIRTUAL_ENV /home/${USER}/.venv

# Pre-download the Hitz model into the container
COPY download.py /home/${USER}/download_model.py
RUN python3 /home/${USER}/download_model.py

ENTRYPOINT wyoming-ovos-stt --uri tcp://0.0.0.0:8080 --debug --plugin-name ovos-stt-plugin-nemo

EXPOSE 8080
