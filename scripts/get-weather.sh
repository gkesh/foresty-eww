#!/bin/bash

WEATHER=$(inxi -xw -c 0)

TEMP=$(echo "$WEATHER" | rg "temperature: (.*)? conditions:" -or '$1' | xargs)
CONDITION=$(echo "$WEATHER" | rg "conditions: (.*?) wind" -or '$1' | xargs)
HUMIDITY=$(echo "$WEATHER" | rg "humidity: (.*)?\%" -or '$1%' | xargs)
LOCATION=$(echo "$WEATHER" | rg "Locale: (.*?), Unknown" -or '$1' | xargs)

# Default values if parsing fails
TEMP="${TEMP%% C*}°C"
CONDITION=$(echo $CONDITION | sed 's/\b\(.\)/\u\1/g')

IMAGE=$(/usr/bin/python3 $HOME/.config/eww/scripts/py/get-weather-image.py "$CONDITION")

echo "{\"temperature\": \"$TEMP\", \"condition\": \"$CONDITION\", \"humidity\": \"$HUMIDITY\", \"location\": \"$LOCATION\", \"image\": \"$IMAGE\"}"