nmcli dev wifi | awk '$1 ~ /\*/' | awk '{ printf "{\"ap\": \"%s\", \"strength\": \"%d\"}", $3, $8 }' | rev | cut -c 1- | rev