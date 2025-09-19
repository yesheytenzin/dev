#!/bin/bash

# Get the battery device (first one found)
BATTERY=$(upower -e | grep BAT | head -n 1)

# Fetch details
INFO=$(upower -i $BATTERY)

# Extract percentage and time remaining
PERCENT=$(echo "$INFO" | grep -E "percentage" | awk '{print $2}')
STATE=$(echo "$INFO" | grep -E "state" | awk '{print $2}')
TIME=$(echo "$INFO" | grep -E "time to empty|time to full" | awk -F: '{print $2}' | xargs)

if [[ "$STATE" == "discharging" ]]; then
    echo "Battery: $PERCENT - Time remaining: $TIME"
elif [[ "$STATE" == "charging" ]]; then
    echo "Battery: $PERCENT - Time to full: $TIME"
else
    echo "Battery: $PERCENT - State: $STATE"
fi

