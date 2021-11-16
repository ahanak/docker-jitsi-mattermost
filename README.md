# Jitsi + Mattermost Docker-Compose setup

## Setup Guide

### Dependencies

`apt-get install docker-compose`

### Setup

```bash
cp env.example .env
vi .env
./setup.sh
```

## Updates

* You should always run current versions of all images:
  ```bash
  docker-compose pull
  docker-compose up -d
  ```
* To update the application Versions, edit `MATTERMOST_IMAGE_TAG` and `JITSI_TAG` in `.env`, then:
  ```bash
  docker-compose pull
  docker-compose up -d
  ```
* It might be required to updates also the docker-compose files. For this do:
  * Replace `docker-compose.mattermost.yml` file by https://github.com/mattermost/docker/blob/main/docker-compose.yml
  * Replace `docker-compose.jitsi.yml` file by https://github.com/jitsi/docker-jitsi-meet/blob/master/docker-compose.yml
  * Add missing variables to the .env file
  
  