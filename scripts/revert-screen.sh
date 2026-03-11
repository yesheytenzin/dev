#!/usr/bin/env bash
# Revert the primary display (eDP-1) rotation to normal

hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1.2,transform,0"

notify-send "✅ Screen rotation reset to normal"

