#!/bin/bash
xrdb -merge ~/.Xdefaults
setxkbmap -layout us -option caps:swapescape
feh --bg-fill ~/Pictures/red_mountain.jpg
xautolock -time 5 -locker "i3lock -t --image ~/Pictures/red_mountain.png" &
