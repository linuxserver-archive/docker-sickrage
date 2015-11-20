#!/bin/bash

[[ ! -d /app/sickrage/.git ]] && git clone https://github.com/SickRage/SickRage.git /app/sickrage
cd /app/sickrage
git pull
chown -R abc:abc /app /config
