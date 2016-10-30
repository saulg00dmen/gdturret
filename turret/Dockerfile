FROM ubuntu
MAINTAINER Guang-De Lin

RUN apt-get update && \
    apt-get install -y transmission-daemon jq
RUN mkdir /downloads /incompletes

EXPOSE 9091 51413 51413/udp

ADD . /data/turret

ENTRYPOINT ["/data/turret/entrypoint.sh"]
