#!/usr/bin/env bash

# Get the first line of the mullvad status output
status=$(mullvad status)
status_line=$(echo $status | head -n 1)

# Check if the line contains 'Disconnected'
if [[ $status_line == *"Disconnected"* ]]; then
	echo " VPN"
# Check if the line contains 'Connected'
elif [[ $status_line == *"Connected"* ]]; then
	location=$(echo $status | grep "Visible location:" | sed -E 's/.*Visible location:[[:space:]]*([^.]*)\..*/\1/' | sed 's/, */,/g')
	wg_word=$(echo $status_line | grep -oE '\S*-wg-\S*')
	echo " $location"
else
	echo " VPN"
fi
