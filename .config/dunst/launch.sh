#!/usr/bin/env sh

source $HOME/.cache/wal/colors.sh

dunst -config ~/.config/dunst/dunstrc \
  -cb "$foreground" \
  -cf "$foreground" \
  -nb "$background" \
  -nf "$foreground" \
  -lb "$background" \
  -lf "$foreground" &
