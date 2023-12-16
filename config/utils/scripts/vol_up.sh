#!/bin/bash

chassis_type=$(cat /sys/class/dmi/id/chassis_type)

pactl set-sink-volume @DEFAULT_SINK@ +5%

# if desktop
if [ "$chassis_type" -eq 3 ]; then
    volume=$(pactl get-sink-volume 0 | awk -F'/' '{print $2}' | awk '{print $1}')
    dunstify -r 420 "  $volume"
fi
