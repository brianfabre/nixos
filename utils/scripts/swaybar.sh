#!/bin/bash
while true; do
    date=$(date +'%A, %b %d')
    time=$(date +'%I:%M %p')  # Customize this format as needed
    echo "$date | $time"
    sleep 10  # Update every second
done

