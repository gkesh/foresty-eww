if [[ $(nmcli | grep -m1 wlp0s20f3 | awk '{print $2}') == 'disconnected' ]]; then
    echo '{"ap": "N/A", "strength": "0"}';
else
    SSID=$(nmcli -t -f in-use,ssid dev wifi| cut -d\' -f2 | grep '*' | cut -c 3-)
    SIGNAL=$(nmcli -t -f in-use,signal dev wifi| cut -d\' -f2 | grep '*' | cut -c 3-)
    echo "{\"ap\": \"$SSID\", \"strength\": \"$SIGNAL\"}";
fi