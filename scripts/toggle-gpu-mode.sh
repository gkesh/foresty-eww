#!/bin/bash

GPU_MODE=$(supergfxctl -g)

case "$GPU_MODE" in
    *"Integrated"*)
        NEXT_MODE="Hybrid"
        ;;
    *"Hybrid"*)
        NEXT_MODE="AsusMuxDgpu"
        ;;
    *"AsusMuxDgpu"*)
        NEXT_MODE="Integrated"
        ;;
    *)
        echo "Unknown current mode: $GPU_MODE"
        echo "Defaulting to Integrated mode"
        NEXT_MODE="Integrated"
        ;;
esac

supergfxctl -m "$NEXT_MODE"

eww update gpu_mode_text="$NEXT_MODE"
if [ $NEXT_MODE == 'Integrated' ]; then
    eww update gpu_mode_icon="󱤓"
elif [ $NEXT_MODE == 'Hybrid' ]; then
    eww update gpu_mode_icon=""
elif [ $NEXT_MODE == 'AsusMuxDgpu' ]; then
    eww update gpu_mode_icon="󰢮"
fi

notify-send -u "critical" "GPU mode changed to $NEXT_MODE, restart to apply changes"

