#!/usr/bin/env sh

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

source $HOME/.cache/wal/colors.sh
bspc config ignore_ewmh_struts true

case $HOSTNAME in
  horizon)
    polybar -c $HOME/.config/polybar/config.ini ultrawide-tray &
    ps aux | grep hideIt.sh | awk '{ print $2 }' | xargs -I {} kill {}
    sleep 2
    hideIt.sh --name '^Polybar tray window$' --direction top --region 2560x0+250+32
    ;;
  air)
    polybar -c $HOME/.config/polybar/config.ini laptop-tray &
    ps aux | grep hideIt.sh | awk '{ print $2 }' | xargs -I {} kill {}
    hideIt.sh --name '^Polybar tray window$' --region 0x1080+10+-40
    ;;
esac

