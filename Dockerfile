FROM lsiobase/alpine.python
MAINTAINER sparklyballs

# set python to use utf-8 rather than ascii
ENV PYTHONIOENCODING="UTF-8"

# set default fork to sickrage/sickrage
ENV FORK=sickrage/sickrage

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8081
VOLUME /config /downloads /tv
