FROM lsiobase/alpine.python:3.6
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# set python to use utf-8 rather than ascii
ENV PYTHONIOENCODING="UTF-8"

# install app
RUN git clone --depth=1 https://github.com/SickRage/SickRage /app/sickrage \

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8081
VOLUME /config /downloads /tv
