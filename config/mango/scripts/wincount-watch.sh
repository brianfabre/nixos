#!/bin/sh
# Refresh mangobar's window count/list modules (signal 9) whenever
# tags or windows change. Started once per session via exec-once.

mon="HDMI-A-2"

{
    stdbuf -oL mmsg watch tags "$mon" &
    stdbuf -oL mmsg watch all-clients
} | while read -r _; do
    # Only signal mangobar once it's been running for 2+ seconds,
    # so it has had time to set up its signal handler
    age=$(ps -o etimes= -C mangobar | head -n1 | tr -d ' ')
    [ -n "$age" ] && [ "$age" -ge 2 ] && pkill -RTMIN+9 mangobar
done
