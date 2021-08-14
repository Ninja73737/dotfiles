#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

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
    elif lsusb -d 2109:8817; then
      polybar -c $HOME/.config/polybar/config.ini ultrawide &
    else
      polybar -c $HOME/.config/polybar/config.ini laptop &
    fi
    ;;
esac

while ! polybar-msg cmd hide; do
  sleep 0.1
done
