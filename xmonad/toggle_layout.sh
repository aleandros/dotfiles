#!/bin/sh

current_layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
case $current_layout in
  us)
    setxkbmap latam
    ;;
  latam)
    setxkbmap us
    ;;
esac
