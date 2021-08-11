#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

# Launch bar
source $HOME/.cache/wal/colors.sh
case $HOSTNAME in
  horizon)
    polybar -c $HOME/.config/polybar/config.ini ultrawide &
    ;;
  air)
    polybar -c $HOME/.config/polybar/config.ini laptop &
    ;;
  zephyrus)
    if xrandr | grep "HDMI-1 connected"; then
      polybar -c $HOME/.config/polybar/config.ini ultrawide &
    elif xrandr | grep "DP-0.2" && xrandr | grep "DP-0.3"; then
      polybar -c $HOME/.config/polybar/config.ini ultrawide &
    else
      polybar -c $HOME/.config/polybar/config.ini laptop &
    fi
    ;;
esac
