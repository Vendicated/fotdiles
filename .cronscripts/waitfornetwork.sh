#!/bin/sh

while ! ping -q -c 1 -W 1 archlinux.org >/dev/null
do
  if [ $((WAIT_FOR_NETWORK_TRIES += 1)) -gt 100 ]
  then
    exit 1
  fi
  sleep 5
done
