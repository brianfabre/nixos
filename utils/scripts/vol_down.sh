#!/bin/bash

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oP '\d+\.\d+')
dunstify -r 420 "   $volume"
