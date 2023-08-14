#!/bin/bash

CUR_BRIGHTNESS=$(cat /sys/class/leds/asus::kbd_backlight/brightness)

if [[ $CUR_BRIGHTNESS -eq 0 ]]; then
    echo "󰥻"
elif [[ $CUR_BRIGHTNESS -eq 1 ]]; then
    echo "󰧺"
else
    echo "󰧹"
fi