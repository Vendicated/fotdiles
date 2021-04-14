#!/bin/sh

killall -q polybar

while pgrep -x polybar >/dev/null
do
  sleep 1
done

polybar main > .cache/polybar.log &
polybar secondary > .cache/polybar2.log &
