#!/usr/bin/env bash

# Get the first line of the mullvad status output
status_line=$(mullvad status | head -n 1)

# Check if the line contains 'Disconnected'
if [[ $status_line == *"Disconnected"* ]]; then
    echo " VPN"
# Check if the line contains 'Connected'
elif [[ $status_line == *"Connected"* ]]; then
    # Extract the word that contains '-wg-'
    wg_word=$(echo $status_line | grep -oE '\S*-wg-\S*')
    echo " $wg_word"
else
    echo "Status unknown"
fi
