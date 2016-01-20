#!/bin/bash

[[ ! -d /app/sickrage/.git ]] && (git clone https://github.com/SickRage/SickRage.git /app/sickrage && \
chown -R abc:abc /app /config)

# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /app/sickrage
git pull
chown -R abc:abc /app /config
