MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [[ "$MUTED" == "[MUTED]" ]]; then
       echo "MM"
       exit 0
fi

echo ${$(($(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}') * 100))%.*}
