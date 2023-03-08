#!/bin/bash

declare -A allWindows
declare -A activeWindows

currentlyOpen=""

# All windows
while read -r window 
do
  windowCount=$(echo "$window" | awk '{ print $1 }')
  windowState=$(echo "$window" | awk '{ print $2 }')
  windowIcon=$(echo "$window" | awk '{ print $3 }')

  allWindows[$(echo $windowCount)]=$windowIcon

  if [[ $windowState == '*' ]]; then
    currentlyOpen=$windowCount
  fi
done < <(wmctrl -d | awk '{ print $1 " " $2 " " substr($9, 7, 8) }' | grep -v NSP)

# Active windows
while read -r activeWindow
do
  windowCount=$(echo "$activeWindow" | awk '{ print $1 }')
  windowText=$(echo "$activeWindow" | awk '{ $1=""; print $0 }')

  activeWindows[$(echo $windowCount)]=$windowText
done < <(wmctrl -l | awk '{ $1=$3=""; print $0 }')

# To output the window string
winString=''

for idx in "${!activeWindows[@]}"
do
  windowLabel=$((idx+1))
  winString="$winString, { 'index': '$windowLabel', 'icon': '${allWindows[$idx]}', 'content': '${activeWindows[$idx]}' }"
done

winString=${winString:2}

# Output workspaces
echo "[$winString]"