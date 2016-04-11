#!/bin/sh

env > /etc/envvars

if [ $# -eq 0 ]; then
  echo "Starting pre-service scritps in /etc/my_init.d"
  for script in /etc/my_init.d/*; do
    if [ -x "$script" ]; then
      echo >&2 "*** Running: $script"
      $script
      retval=$?
      if [ $retval != 0 ]; then
        echo >&2 "*** Failed with return value: $?"
        exit $retval
      fi
    fi
  done

  exec /sbin/runsvdir -P /etc/service
fi

exec $@
