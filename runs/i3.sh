#!/bin/bash
echo "setting up i3...."
sudo apt install i3 i3-wm i3status i3lock
cp -r ~/personal/dev/.config/i3 ~/.config


echo "setting up i3status"
cp -r ~/personal/dev/.config/i3status ~/.config
mkdir -p ~/.config/picom
cp -r ~/personal/dev/.config/picom/picom.conf ~/.config/picom
