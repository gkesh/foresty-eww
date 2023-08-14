#!/bin/bash

get_workspace_metric() {
  [[ $2 == "*" ]] && active_class="active" || active_class=""
  echo "(box :class \"workspace $active_class\" (button :class \"metric-workspace $active_class\" :onclick \"wmctrl -s $1\" \"$3\"))"
}

get_empty_workspace_metric() {
  read -r count active name <<<$(wmctrl -d | grep "*" | awk '{ print $1 " " $2 " " $9 }' | sed -n "1p")
  get_workspace_metric "$count" "$active" "$name"
}

get_workspaces() {
  if [[ $(wmctrl -l) != '' ]]; then
    active_in_list=1

    while read line; do
      line=$((line + 1))
      read -r count active name <<<$(wmctrl -d | awk '{ print $1 " " $2 " " $9 }' | sed -n "$(echo $line)p")
      get_workspace_metric "$count" "$active" "$name"
      if [[ $active == "*" ]]; then
        active_in_list=0
      fi
    done < <(wmctrl -l | awk '{ print $2 }' | sort | uniq)
    
    if [[ $active_in_list -eq 1 ]]; then
      get_empty_workspace_metric
    fi
  else
    get_empty_workspace_metric
  fi
  
}

echo '(box :orientation "v" :class "workspaces" :space-evenly true :hexpand true '"$(get_workspaces)"')'
