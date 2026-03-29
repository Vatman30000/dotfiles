#!/usr/bin/env bash

LEVEL=$(upower -i /org/freedesktop/UPower/devices/battery_gip0x0 |
  awk -F': *' '/battery-level/ {print $2}')

ICON="󰖻" # default / unknown

case "$LEVEL" in
full)
  ICON="󰝍"
  ;;
high)
  ICON="󰝏"
  ;;
normal)
  ICON="󰝎"
  ;;
low)
  ICON="󰝌"
  ;;
critical)
  ICON="󰨢"
  ;;
esac

echo "$ICON"
