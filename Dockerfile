FROM alpine:3.4

RUN apk add -U su-exec dcron && \
    apk add -UX http://dl-4.alpinelinux.org/alpine/edge/community runit && \
    mkdir -p /etc/service /etc/startup && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY . /

ENTRYPOINT ["/docker-entrypoint.sh"]
