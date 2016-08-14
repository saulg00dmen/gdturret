FROM ubuntu
MAINTAINER Guang-De Lin

RUN apt-get update \
    && apt-get install -y transmission-daemon
RUN mkdir /downloads /incompletes

EXPOSE 9091 51413 51413/udp

ENTRYPOINT ["/usr/bin/transmission-daemon", "--foreground", "--allowed", "*.*.*.*", "--download-dir", "/downloads", "--incomplete-dir", "/incompletes"]
