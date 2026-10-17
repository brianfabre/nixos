#!/bin/sh
# Usage: volume.sh up|down|mute
step=2

# Find the sink that's currently playing audio; fall back to the default
sink=$(pactl list short sinks | awk '$NF == "RUNNING" {print $2; exit}')
[ -n "$sink" ] || sink=@DEFAULT_SINK@

# Make the playing device the default so the bar's indicator follows it
[ "$sink" != "@DEFAULT_SINK@" ] && pactl set-default-sink "$sink"

case "$1" in
  up)
    vol=$(pactl get-sink-volume "$sink" | awk '/Volume/ {gsub("%", "", $5); print $5; exit}')
    new=$((vol + step))
    [ "$new" -gt 100 ] && new=100
    pactl set-sink-volume "$sink" "${new}%"
    ;;
  down)
    pactl set-sink-volume "$sink" "-${step}%"
    ;;
  mute)
    pactl set-sink-mute "$sink" toggle
    ;;
esac
