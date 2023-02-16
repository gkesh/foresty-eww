if [[ $(nmcli | grep -m1 wlp0s20f3 | awk '{print $2}') == 'disconnected' ]]; then
    echo '{"ap": "N/A", "strength": "0"}';
else
    nmcli dev wifi | awk '$1 ~ /\*/' | awk '{ printf "{\"ap\": \"%s\", \"strength\": \"%d\"}", $3, $8 }' | rev | cut -c 1- | rev;
fi