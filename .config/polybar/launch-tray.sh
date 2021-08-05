#!/usr/bin/env sh

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

source $HOME/.cache/wal/colors.sh
bspc config ignore_ewmh_struts true

polybar -c $HOME/.config/polybar/config.ini tray &
