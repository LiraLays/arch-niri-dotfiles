#!/bin/sh
# Power levels
CRITICAL_LEVEL=15
VERY_LOW_LEVEL=5

while true; do
  # Taking current charge and status (Charging/Discharging)
  BATTERY_PATH=$(find /sys/class/power_supply/ -name "BAT*" | head -n 1)
  CAPACITY=$(cat "$BATTERY_PATH/capacity")
  STATUS=$(cat "$BATTERY_PATH/status")

  if [ "$STATUS" = "Discharging" ]; then
    if [ "$CAPACITY" -le "$VERY_LOW_LEVEL" ]; then
      notify-send -u critical "CRITICAL CHARGE" "Battery level: $CAPACITY%"
      sleep 60
    elif ["$CAPACITY" -le "$CRITICAL_LEVEL" ]; then
      notify-send -u normal "Low charge" "It's time to connect the charge: $CAPACITY%"
      sleep 300
    fi
  fi
  sleep 60 # Check once per minute
done
