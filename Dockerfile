# https://github.com/fluent/fluentd-docker-image

FROM alpine
MAINTAINER Raymond Wen

ENV FILEBEAT_VERSION=1.2.3

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && apk add ca-certificates rsyslog && wget https://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz -O - | tar zxv
ENV PATH=/filebeat-${FILEBEAT_VERSION}-x86_64:$PATH

CMD filebeat
