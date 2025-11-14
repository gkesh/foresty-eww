#!/bin/bash

ALBUM_ART=$(playerctl metadata --format '{{mpris:artUrl}}')
eww update music_bg="$(python3 ./py/get-album-colors.py $ALBUM_ART --colors 4)"