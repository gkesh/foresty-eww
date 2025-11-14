#!/bin/bash
CPU_MODE=$(asusctl profile -p | grep "Active profile" | awk '{print $4}')
GPU_MODE=$(supergfxctl -g)

eww update mode_text="$CPU_MODE"
if [ $CPU_MODE == 'Performance' ]; then
    eww update mode_icon="󱪈"
elif [ $CPU_MODE == 'Quiet' ]; then
    eww update mode_icon=""
elif [ $CPU_MODE == 'Balanced' ]; then
    eww update mode_icon="󰚀"
fi

eww update gpu_mode_text="$GPU_MODE"
if [ $GPU_MODE == 'Integrated' ]; then
    eww update gpu_mode_icon="󱤓"
elif [ $GPU_MODE == 'Hybrid' ]; then
    eww update gpu_mode_icon=""
elif [ $GPU_MODE == 'AsusMuxDgpu' ]; then
    eww update gpu_mode_icon="󰢮"
fi