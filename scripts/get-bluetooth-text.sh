#! /bin/bash
STATUS=$(bluetoothctl show | grep Powered | awk '{ print $2 }')

if [[ $STATUS -eq 0 ]]; then
    echo "Powered Off"
else
    echo "Not Connected"
fi