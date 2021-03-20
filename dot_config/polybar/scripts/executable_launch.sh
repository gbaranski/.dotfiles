#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# # Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  MONITOR=$m polybar --config=$HOME/.config/polybar/config.ini mybar &

  echo "Polybar launched for monitor ${m}"
done

