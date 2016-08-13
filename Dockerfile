FROM ubuntu
MAINTAINER Guang-De Lin

RUN apt-get update \
    && apt-get install -y transmission-daemon

EXPOSE 9091 51413 51413/udp

ENTRYPOINT ["/usr/bin/transmission-daemon", "--foreground", "--allowed", "*.*.*.*", "--config-dir", "/var/lib/transmission-daemon/info"]
