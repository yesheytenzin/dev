#!/bin/bash

MONITOR="eDP-1"

# Get monitor info in JSON
INFO=$(hyprctl monitors -j | jq ".[] | select(.name==\"$MONITOR\")")

# Extract current values
RES=$(echo "$INFO" | jq -r '"\(.width)x\(.height)@\(.refreshRate)"')
POS=$(echo "$INFO" | jq -r '"\(.x)x\(.y)"')
SCALE=$(echo "$INFO" | jq -r '.scale')
TRANSFORM=$(echo "$INFO" | jq -r '.transform')

# Toggle transform
if [ "$TRANSFORM" = "2" ]; then
    NEWTRANSFORM=0
else
    NEWTRANSFORM=2
fi

# Apply change
hyprctl keyword monitor "$MONITOR,$RES,$POS,$SCALE,transform,$NEWTRANSFORM"

