#!/bin/bash

STATUS=$(bluetoothctl show | grep Powered | awk '{ print $2 }')

if [[ $STATUS == 'no' ]]; then
  bluetoothctl power on > /dev/null 2>&1
else
  bluetoothctl power off > /dev/null 2>&1
fi

eww update bluetooth=$($HOME/.config/eww/scripts/get-bluetooth-status.sh)
eww update bluetooth_icon=$($HOME/.config/eww/scripts/get-bluetooth-icon.sh)
