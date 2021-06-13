#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch bar
source $HOME/.cache/wal/colors.sh
case $HOSTNAME in
  horizon)
    polybar -c $HOME/.config/polybar/config.ini ultrawide &
    ;;
  air)
    polybar -c $HOME/.config/polybar/config.ini laptop &
    ;;
esac

if [ "$(playerctl --player=spotify status)" = "Playing" ]; then
  while ! find /tmp/ -maxdepth 1 -name "polybar_mqueue.*" | grep -q .; do sleep 0.1; done
  sleep 1
  polybar-msg cmd show.spotify && polybar-msg cmd show.spotify-next && polybar-msg cmd show.spotify-previous
fi
