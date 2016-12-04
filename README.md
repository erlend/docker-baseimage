# Minimal baseimage

A bare metal image to base to use for your own docker images. It's kinda like
[phusion/baseimage](https://hub.docker.com/r/phusion/baseimage), but using
[Alpine Linux](https://alpinelinux.org) instead of Ubuntu.

## Getting started

runscript.sh
```
#!/bin/sh
. /etc/env
exec nginx -g "daemon off;"
```

Dockerfile
```
FROM erlend/baseimage
RUN apk add --no-cache nginx
COPY runscript.sh /etc/service/nginx/run
```

### Adding services

Create a shell script which runs your daemon, name it `run` and place it in the
`/etc/service/<NAME>` directory. You can find a [collection of run scripts
here](http://smarden.org/runit/runscripts.html).

### Startup scripts

Put scripts you want to run before runit in `/etc/startup`. Make sure the files
are executable, has a she-bang on the first line (i.e. #!/bin/sh) and with
filenames only existing of upper and lower case letters, digits, underscores,
and hyphens (no file extension).

### Cron jobs

Cron is disabled by default, but can easily be enabled by deleting the file
`/etc/service/dcron/down`. Then all you need to do is add your scripts to one of
the subdirectories in `/etc/periodic` (15min, hourly, daily, weekly or monthly),
i.e. a script placed in `/etc/periodic/hourly` will run every hour.

### SSH Server

There is no SSH server included in this image, however one is easily installed.
You can choose between the lightweight `dropbear` or the more common `openssh`,
and install it with `apk add -U <name>`.
