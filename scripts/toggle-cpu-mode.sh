#!/bin/bash
asusctl profile -n

CUR_MODE=$(asusctl profile -p | grep "Active profile" | awk '{print $4}')

if [ $CUR_MODE == 'Performance' ]; then
    eww update mode_icon="󱪈"
    eww update mode_text="Performance"
elif [ $CUR_MODE == 'Quiet' ]; then
    eww update mode_icon=""
    eww update mode_text="Quiet"
elif [ $CUR_MODE == 'Balanced' ]; then
    eww update mode_icon="󰚀"
    eww update mode_text="Balanced"
fi
