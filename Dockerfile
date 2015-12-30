FROM linuxserver/baseimage.python

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>, lonix <lonix@linuxserver.io>

ENV APTLIST="python-dev"

# set python to use utf-8 rather than ascii
ENV PYTHONIOENCODING="UTF-8"

# install pip packages
RUN apt-get update -qy && \
apt-get install $APTLIST -qy && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# build unrar
RUN mkdir -p /tmp/unrar && \
curl -o /tmp/unrarsource.tar.gz -L http://rarlab.com/rar/unrarsrc-5.2.7.tar.gz && \
tar -xvf /tmp/unrarsource.tar.gz -C /tmp/unrar --strip-components=1 && \
cd /tmp/unrar && \
make -f makefile && \
install -v -m755 unrar /usr/bin && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config /downloads /tv
EXPOSE 8081


