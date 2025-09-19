#!/bin/bash

# A simple script to update and upgrade Ubuntu system packages

# Exit immediately if a command exits with a non-zero status
set -e

echo "------------------------------------"
echo "   Starting system update & upgrade "
echo "------------------------------------"

# Update package lists
sudo apt update -y

# Upgrade installed packages
sudo apt upgrade -y

# Perform full distribution upgrade (kernel, dependencies, etc.)
sudo apt full-upgrade -y

# Remove unnecessary packages
sudo apt autoremove -y

# Clean up cached package files
sudo apt autoclean -y

echo "------------------------------------"
echo "   System update & upgrade complete "
echo "------------------------------------"

