#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch bar
source $HOME/.cache/wal/colors.sh
case $HOSTNAME in
  horizon-arch)
    polybar -c $HOME/.config/polybar/config.ini ultrawide &
    ;;
  arch-air)
    polybar -c $HOME/.config/polybar/config.ini laptop &
    ;;
esac
