#!/bin/bash

# Set governor to powersave
cpupower frequency-set -g powersave

# Set frequency limits
#cpupower frequency-set -u 1.8GHz
#cpupower frequency-set -d 800MHz
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
echo 70 > /sys/devices/system/cpu/intel_pstate/max_perf_pct
echo 20 > /sys/devices/system/cpu/intel_pstate/min_perf_pct

