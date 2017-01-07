FROM alpine:3.5

RUN apk add -U su-exec dcron runit && \
    mkdir -p /etc/service /etc/startup && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY . /

ENTRYPOINT ["/docker-entrypoint.sh"]
