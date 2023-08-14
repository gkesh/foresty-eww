if [[ $(iwctl station wlan0 show | grep State | awk '{ print $2 }') == 'disconnected' ]]; then
    echo '{"ap": "N/A", "strength": "0"}'
else
    SSID=$(iwctl station wlan0 show | grep "Connected network" | awk '{ print $3 }')
    DB=$(iwctl station wlan0 show | grep " RSSI" | awk '{ print $2 }')

    if [[ $DB -lt -83 ]]; then
       SIGNAL=10
    elif [[ $DB -lt -80 ]]; then
       SIGNAL=30
    elif [[ $DB -lt -75 ]]; then
       SIGNAL=50
    elif [[ $DB -lt -69 ]]; then
       SIGNAL=60
    elif [[ $DB -lt -66 ]]; then
       SIGNAL=70
    elif [[ $DB -lt -63 ]]; then
       SIGNAL=75
    elif [[ $DB -lt -56 ]]; then
       SIGNAL=80
    elif [[ $DB -lt -51 ]]; then
       SIGNAL=90
    else
       SIGNAL=100
    fi

    echo "{\"ap\": \"$SSID\", \"strength\": \"$SIGNAL\"}"
fi
