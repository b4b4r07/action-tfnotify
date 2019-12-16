FROM golang:1.13.5-stretch

ENV TFNOTIFY_VERSION=0.4.0

RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  jq

RUN mkdir -p /tmp/tfnotify \
    && cd /tmp/tfnotify \
    && wget https://github.com/mercari/tfnotify/releases/download/v${TFNOTIFY_VERSION}/tfnotify_${TFNOTIFY_VERSION}_linux_amd64.tar.gz \
    && tar zxvf tfnotify_${TFNOTIFY_VERSION}_linux_amd64.tar.gz \
    && mv tfnotify /usr/local/bin/tfnotify \
    && cd / \
    && rm -rf /tmp/tfnotify

COPY run-tfnotify /usr/bin/run-tfnotify

ENTRYPOINT ["/usr/bin/run-tfnotify"]
