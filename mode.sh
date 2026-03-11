#!/bin/bash

if lspci -nnk | grep -A3 NVIDIA | grep -q vfio-pci; then
    echo "GPU Mode: VFIO (VM Passthrough)"
else
    echo "GPU Mode: Linux (NVIDIA driver)"
fi

