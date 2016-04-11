FROM alpine:3.3

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
        apk add -U su-exec runit@testing && \
        rm -rf /var/cache/apk/* && \
        mkdir -p /etc/service /etc/my_init.d

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
