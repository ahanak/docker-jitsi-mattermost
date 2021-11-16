#!/usr/bin/env bash
export $(grep -v '^#' .env | xargs -d '\n')


# mattermost dirs
MM_DIRS="$MATTERMOST_CONFIG_PATH $MATTERMOST_DATA_PATH $MATTERMOST_LOGS_PATH $MATTERMOST_PLUGINS_PATH $MATTERMOST_CLIENT_PLUGINS_PATH"
#echo $MM_DIRS
mkdir -p $MM_DIRS
chown -R 2000:2000 $MM_DIRS

# jitsi dirs
mkdir -p ${CONFIG}/{web/crontabs,web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}