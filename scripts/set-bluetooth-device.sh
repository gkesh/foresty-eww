#!/bin/bash

bluetoothctl power on

if [[ $? -eq 0 ]]; then
	bluetoothctl remove 98:0D:6F:F4:C1:8E
	bluetoothctl scan on &
	sleep 2
	bluetoothctl pair 98:0D:6F:F4:C1:8E
	bluetoothctl connect 98:0D:6F:F4:C1:8E

	if [[ $? -eq 0 ]]; then
		echo "Connected to gBuds"
	else
		echo "Failed to connect to gBuds"
	fi
else
	echo "Failed to turn on bluetooth"
fi
