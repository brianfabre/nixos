#!/bin/bash

# Get current date and time
DATE=$(date +'%A, %b %d')
TIME=$(date +'%I:%M %p')


# # Get Wi-Fi status
# WIFI_STATUS=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
#
# if [ -z "$WIFI_STATUS" ]; then
#     WIFI_STATUS="Not connected"
# else
#     WIFI_STATUS="Connected to $WIFI_STATUS"
# fi

# Send notification
notify-send "### status ###" "󰃭  $DATE\n  $TIME"

