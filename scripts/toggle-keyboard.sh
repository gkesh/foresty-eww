#!/bin/bash

CUR_BRIGHTNESS=$(cat /sys/class/leds/asus::kbd_backlight/brightness)

if [[ $CUR_BRIGHTNESS -eq 3 ]]; then
	LED_BRIGHTNESS=0
else
	LED_BRIGHTNESS=$(($((CUR_BRIGHTNESS+1))*50))
fi

light -s sysfs/leds/asus::kbd_backlight -S $LED_BRIGHTNESS
eww update kbd_icon="$(/home/gkesh/.config/eww/scripts/get-keyboard-icon.sh)"
