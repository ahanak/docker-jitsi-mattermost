#!/usr/bin/env bash
export $(grep -v '^#' .env | xargs -d '\n')


# mattermost dirs
MM_DIRS="$MATTERMOST_CONFIG_PATH $MATTERMOST_DATA_PATH $MATTERMOST_LOGS_PATH $MATTERMOST_PLUGINS_PATH $MATTERMOST_CLIENT_PLUGINS_PATH"
#echo $MM_DIRS
mkdir -p $MM_DIRS
chown -R 2000:2000 $MM_DIRS

# jitsi dirs
mkdir -p ${CONFIG}/{web/crontabs,web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
#!/usr/bin/env bash

function generatePassword() {
    openssl rand -hex 16
}

JICOFO_AUTH_PASSWORD=$(generatePassword)
JVB_AUTH_PASSWORD=$(generatePassword)
JIGASI_XMPP_PASSWORD=$(generatePassword)
JIBRI_RECORDER_PASSWORD=$(generatePassword)
JIBRI_XMPP_PASSWORD=$(generatePassword)
POSTGRES_PASSWORD=$(generatePassword)

sed -i.bak \
    -e "s#POSTGRES_PASSWORD=.*#POSTGRES_PASSWORD=${POSTGRES_PASSWORD}#g" \
    -e "s#JICOFO_AUTH_PASSWORD=.*#JICOFO_AUTH_PASSWORD=${JICOFO_AUTH_PASSWORD}#g" \
    -e "s#JVB_AUTH_PASSWORD=.*#JVB_AUTH_PASSWORD=${JVB_AUTH_PASSWORD}#g" \
    -e "s#JIGASI_XMPP_PASSWORD=.*#JIGASI_XMPP_PASSWORD=${JIGASI_XMPP_PASSWORD}#g" \
    -e "s#JIBRI_RECORDER_PASSWORD=.*#JIBRI_RECORDER_PASSWORD=${JIBRI_RECORDER_PASSWORD}#g" \
    -e "s#JIBRI_XMPP_PASSWORD=.*#JIBRI_XMPP_PASSWORD=${JIBRI_XMPP_PASSWORD}#g" \
    "$(dirname "$0")/.env"
