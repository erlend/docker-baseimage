FROM alpine:3.4

RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/community" \
      >> /etc/apk/repositories && \
    apk add -U su-exec runit@edge && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/service /etc/my_init.d /etc/runit

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
