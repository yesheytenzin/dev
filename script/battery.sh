#!/bin/bash

# Change BAT1 to your battery name if different (check with ls /sys/class/power_supply/)
BATTERY_PATH="/sys/class/power_supply/BAT1"

if [ -d "$BATTERY_PATH" ]; then
    capacity=$(cat "$BATTERY_PATH/capacity")
    status=$(cat "$BATTERY_PATH/status")
    echo "Battery status: $status"
    echo "Battery percentage: $capacity%"
else
    echo "Battery information not found at $BATTERY_PATH"
fi

