#!/bin/bash

[[ $(bluetoothctl show | grep Powered | awk '{ print $2 }') == 'no' ]] && echo 0 || echo 1
