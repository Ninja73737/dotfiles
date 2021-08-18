#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

source $HOME/.cache/wal/colors.sh
monitor=$(polybar --list-monitors | awk -F : '{ print $1 }' | grep '(primary)')
MONITOR=$monitor MONITOR_WIDTH=$(polybar --list-monitors | grep "$monitor" | awk -F : '{ print $2 }' | awk -F x '{ print $1 }' | tr -d ' ') polybar -c $HOME/.config/polybar/config.ini main &
for monitor in $(polybar --list-monitors | awk -F : '{ print $1 }' | grep -v '(primary)'); do
  MONITOR=$monitor MONITOR_WIDTH=$(polybar --list-monitors | grep "$monitor" | awk -F : '{ print $2 }' | awk -F x '{ print $1 }' | tr -d ' ') polybar -c $HOME/.config/polybar/config.ini main &
done

while ! polybar-msg cmd hide; do
  sleep 0.1
done
