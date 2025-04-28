#!/bin/bash
asusctl profile -n

CUR_MODE=$(asusctl profile -p | tail -1f | awk '{print $4}')

if [ $CUR_MODE == 'Performance' ]; then
    eww update mode_icon="󱪈 "
    eww update mode_text="Performance Mode"
elif [ $CUR_MODE == 'Quiet' ]; then
    eww update mode_icon="  "
    eww update mode_text="Eco Mode"
elif [ $CUR_MODE == 'Balanced' ]; then
    eww update mode_icon="󰚀 "
    eww update mode_text="Balanced Mode"
fi
