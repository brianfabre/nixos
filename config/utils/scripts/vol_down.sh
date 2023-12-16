#!/bin/bash

chassis_type=$(cat /sys/class/dmi/id/chassis_type)

# if desktop
if [ "$chassis_type" -eq 10 ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
else
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    volume=$(pactl get-sink-volume 0 | awk -F'/' '{print $2}' | awk '{print $1}')
    dunstify -r 420 "  $volume"
fi
