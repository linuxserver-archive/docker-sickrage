#!/bin/bash

if [ ! -d /app/sickrage/.git ]; then
git clone https://github.com/SiCKRAGETV/SickRage.git /app/sickrage
else
cd /app/sickrage
git pull
fi
chown -R abc:abc /app /config
