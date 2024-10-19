#!/usr/bin/env bash

# Print a JSON array with 6 indices
# 0-4th index representing the status for workspace IDs 1 through 5
# 5th index represents the status for all workspace IDs greater than 6.
# The variables of array are defined as follows:
# 0 - disabled, 1 - idle, 2 - active
# Example [1, 1, 2, 0, 0, 0] is workspace 1,2 is idle, workspace 3 is active, 4, 5, 6+ is disable

ws=(0 0 0 0 0 0)

printWorkspace() {
  json_array=$(echo "${ws[@]}" | jq -sc .)
  echo "$json_array"
}

getWorkspace() {
  ws=(0 0 0 0 0 0)

  idle=($(hyprctl -j workspaces | jq -r 'map(.id) | @sh'))
  active=($(hyprctl -j activeworkspace | jq -r 'if type != "array" then [.id] else map(.id) end | @sh'))

  for i in ${idle[@]}; do
    if [[ i -gt 5 ]]; then
      ws[5]=1
      break
    fi
    ws[i - 1]=1
  done

  for i in ${active[@]}; do
    if [[ i -gt 5 ]]; then
      ws[5]=2
      break
    fi
    ws[i - 1]=2
  done

  printWorkspace
}

handle() {
  case $1 in
  workspace\>\>* | destroyworkspace\>\>* | moveworkspace\>\>*)
    getWorkspace
    ;;
  esac
}

getWorkspace
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
