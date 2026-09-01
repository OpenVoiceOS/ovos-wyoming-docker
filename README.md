# OVOS Wyoming Docker

A collection of Docker images for running [OVOS](https://openvoiceos.org) services using the [Wyoming Protocol](https://github.com/Rhasspy/wyoming). Use these images to run TTS, STT, and wake word services with Docker and Docker Compose.

![OVOS assist via ollama integration](https://github.com/user-attachments/assets/906befdb-1c7d-4580-9f7e-039bf6c75b73)

![OVOS Wyoming plugins](https://github.com/user-attachments/assets/cc5e69ae-7549-45a9-a48f-94d57d07129c)

---

## Getting started

### Build the images

Build all images manually:

```bash
./build.sh
```

Or build them with Docker Compose:

```bash
docker compose build
```

### Add to Home Assistant

Add the services to Home Assistant with the Wyoming integration.

![image](https://github.com/user-attachments/assets/ad44dbea-1cae-4dbd-9a9d-0bdb9688f98f)

![image](https://github.com/user-attachments/assets/4c8ebdca-cc80-4747-ab3a-9a4b23d70343)

Add the OVOS agent with the Ollama integration.

![image](https://github.com/user-attachments/assets/18e28f47-7acf-4f36-a121-4451cec66a38)

![image](https://github.com/user-attachments/assets/9f6ed44a-8303-49ee-ae9b-29604bfb38f6)

Point your Wyoming satellites to OVOS.

![image](https://github.com/user-attachments/assets/e71a9a4b-8a47-418c-9ab8-529264c8ad3b)

---

## Compose setup

Edit `docker-compose.yml` to fit your setup. Below is an example with multiple TTS, STT, and wake word services.

Set `${CONFIG_BASE_DIR}` to the path that holds your `mycroft.conf` file.

```yaml
services:
  ovos-assist-agent:
    image: ovos-persona/ovos-core
    restart: always
    container_name: ovos_core_persona
    # network_mode: host in order to be able to connect to the bus
    network_mode: host
    #ports:
    #  - 8337:8337
    
  wyoming-ovos-tts-sam:
    image: jarbasai/ovos-wyoming-tts-sam:latest
    container_name: wyoming-ovos-tts-sam
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10605:8080

  wyoming-ovos-tts-nos:
    image: jarbasai/ovos-wyoming-tts-nos:latest
    container_name: wyoming-ovos-tts-nos
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10604:8080

  wyoming-ovos-tts-mimic:
    image: jarbasai/ovos-wyoming-tts-mimic:latest
    container_name: wyoming-ovos-tts-mimic
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10603:8080

  wyoming-ovos-tts-google-tx:
    image: jarbasai/ovos-wyoming-tts-google-tx:latest
    container_name: wyoming-ovos-tts-google-tx
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10602:8080

  wyoming-ovos-tts-matxa:
    image: jarbasai/ovos-wyoming-tts-matxa:latest
    container_name: wyoming-ovos-tts-matxa
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10601:8080

  wyoming-ovos-tts-servers:
    image: jarbasai/ovos-wyoming-tts-servers:latest
    container_name: wyoming-ovos-tts-servers
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10600:8080

  wyoming-ovos-stt-servers:
    image: jarbasai/ovos-wyoming-stt-servers:latest
    container_name: wyoming-ovos-stt-servers
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10501:8080

  wyoming-ovos-chromium-stt:
    image: jarbasai/ovos-wyoming-chromium:latest
    container_name: wyoming-ovos-chromium-stt
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10500:8080

  wyoming-ovos-wakewords:
    image: jarbasai/ovos-wyoming-wakewords:latest
    container_name: wyoming-ovos-wakewords
    restart: unless-stopped
    volumes:
      - ${CONFIG_BASE_DIR}/mycroft/mycroft.conf:/etc/mycroft/mycroft.conf
    ports:
      - 10900:8080
```

---

## Configuration

All services use a shared `mycroft.conf` file. This file is usually at:

```
/etc/mycroft/mycroft.conf
```

Set `${CONFIG_BASE_DIR}` to the base directory that holds your config, for example:

```bash
export CONFIG_BASE_DIR=$HOME/.config/mycroft
```

---

## Testing

After all services start, test them with a Wyoming-compatible client.

---

## Feedback and contributions

Pull requests are welcome. For a major change, open an issue first to discuss the change.

---

## Related projects

- [OpenVoiceOS/ovos-core](https://github.com/OpenVoiceOS/ovos-core) — the OVOS assistant core these images run.
- [Rhasspy/wyoming](https://github.com/Rhasspy/wyoming) — the Wyoming Protocol used by these services.

## Credits

Developed by [TigreGótico](https://tigregotico.pt) for
[OpenVoiceOS](https://openvoiceos.org).

[![NGI0 Commons Fund](./ngi.png)](https://nlnet.nl/project/OpenVoiceOS)

This project was funded through the [NGI0 Commons Fund](https://nlnet.nl/commonsfund),
a fund established by [NLnet](https://nlnet.nl) with financial support from the
European Commission's [Next Generation Internet](https://ngi.eu) programme, under
the aegis of [DG Communications Networks, Content and Technology](https://commission.europa.eu/about-european-commission/departments-and-executive-agencies/communications-networks-content-and-technology_en)
under grant agreement No [101135429](https://cordis.europa.eu/project/id/101135429).
