FROM golang
MAINTAINER Guang-De Lin

RUN apt-get update \
    && apt-get install -y inotify-tools
RUN go get -u github.com/odeke-em/drive/cmd/drive
RUN mkdir /gdrive
ADD ./file_change_listener.sh /

ENTRYPOINT ["/file_change_listener.sh"]
