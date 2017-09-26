#!/usr/bin/env bash

if [[ -z "$(pidof i3lock)" ]]; then
  {
      killall compton
      i3lock -n -i ~/.config/i3/backgrounds/1941277.png --tiling
      compton -b --config ~/.config/compton.conf
  } &
else
  echo "i3lock is already running"
fi
