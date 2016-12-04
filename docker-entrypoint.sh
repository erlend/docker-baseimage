#!/bin/sh

rm -f /etc/env
for varname in `env | grep -o "^[A-Z_0-9]*"`; do
  echo "$varname=\"`printenv $varname`\"" >> /etc/env
done

if [ $# -eq 0 ]; then
  echo "Starting pre-service scripts in /etc/startup"
  run-parts /etc/startup

  set -- /sbin/runsvdir -P /etc/service
fi

exec $@
