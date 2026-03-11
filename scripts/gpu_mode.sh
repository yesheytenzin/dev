#!/bin/bash

VFIO_FILE="/etc/modprobe.d/vfio.conf"
BL_FILE="/etc/modprobe.d/blacklist-nvidia.conf"

if grep -q "^options vfio-pci" "$VFIO_FILE"; then
    echo "Switching to Linux GPU mode..."

    sudo sed -i 's/^options vfio-pci/# options vfio-pci/' $VFIO_FILE
    sudo sed -i 's/^blacklist/# blacklist/' $BL_FILE

    MODE="Linux (NVIDIA enabled)"

else
    echo "Switching to VM GPU mode (VFIO)..."

    sudo sed -i 's/^# options vfio-pci/options vfio-pci/' $VFIO_FILE
    sudo sed -i 's/^# blacklist/blacklist/' $BL_FILE

    MODE="VFIO (GPU passthrough)"
fi

echo "Rebuilding kernel image..."
sudo limine-mkinitcpio

echo ""
echo "GPU mode switched to: $MODE"
echo "Reboot required."

