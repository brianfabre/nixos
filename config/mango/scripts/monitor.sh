#!/bin/sh
INTERNAL=eDP-1

has_external() {
  wlr-randr | grep -qE '^(DP|HDMI|USB-C)[^ ]*-[0-9]'
}

lid_closed() {
  grep -q closed /proc/acpi/button/lid/*/state 2>/dev/null
}

case "$1" in
  close)
    has_external && mmsg dispatch disable_monitor,$INTERNAL ;;
  open)
    mmsg dispatch enable_monitor,$INTERNAL ;;
  check)   # for booting/logging in with the lid already shut
    lid_closed && has_external && mmsg dispatch disable_monitor,$INTERNAL ;;
esac
