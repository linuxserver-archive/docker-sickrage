FROM lsiobase/alpine.python:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
ARG SICKRAGE_COMMIT
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# set python to use utf-8 rather than ascii
ENV PYTHONIOENCODING="UTF-8"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	jq \
	nodejs && \
 echo "**** install app ****" && \
 if [ -z ${SICKRAGE_COMMIT+x} ]; then \
        SICKRAGE_COMMIT=$(curl -sX GET https://api.github.com/repos/SickChill/SickChill/commits/master \
        | jq -r '. | .sha'); \
 fi && \
 mkdir -p /app/sickrage && \
 cd /app/sickrage && \
 git init && \
 git remote add origin https://github.com/SickChill/SickChill.git && \
 git fetch --depth 1 origin ${SICKRAGE_COMMIT} && \
 git checkout FETCH_HEAD && \
 echo "**** cleanup ****" && \
 rm -f /tmp/*


# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8081
VOLUME /config /downloads /tv
