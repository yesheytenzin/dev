#!/usr/bin/env bash
# Rotate the primary display (eDP-1) by 180 degrees in Hyprland

# Set monitor rotation
hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1.2,transform,2"

# Optional: notify user
notify-send "🌀 Screen rotated 180°"

