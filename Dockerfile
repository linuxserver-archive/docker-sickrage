FROM lsiobase/alpine.python:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# set python to use utf-8 rather than ascii
ENV PYTHONIOENCODING="UTF-8"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	nodejs && \
 echo "**** install app ****" && \
 git clone --depth=1 https://github.com/SickChill/SickChill.git /app/sickrage

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8081
VOLUME /config /downloads /tv
