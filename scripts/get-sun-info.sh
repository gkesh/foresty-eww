#!/bin/bash

SUN_TIME=$(curl -s "wttr.in?format=j1" | jq -r '.weather[0].astronomy[0] | "\(.sunrise)|\(.sunset)"')

sunrise=$(echo "$SUN_TIME" | cut -d'|' -f1)
sunset=$(echo "$SUN_TIME" | cut -d'|' -f2)

# Trim spaces (in case there are any)
sunrise=$(echo "$sunrise" | xargs)
sunset=$(echo "$sunset" | xargs)

# Echo as JSON
echo "{\"sunrise\": \"$sunrise\", \"sunset\": \"$sunset\"}"