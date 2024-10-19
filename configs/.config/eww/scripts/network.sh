#!/usr/bin/env bash

getNetwork() {
  type=$(nmcli -f TYPE connection | awk 'NR==2 {print $1}')

  case "$type" in
  ethernet)
    icon="󰈀"
    class="ethernet"
    ;;
  wifi)
    icon="󰖩"
    class="wifi"
    ;;
  *)
    icon="󰖪"
    class="netDisconnect"
    ;;
  esac

  echo "{\"class\":\"$class\",\"icon\":\"$icon\"}"
}

old=$(getNetwork)
echo $old

while true; do
  sleep 5

  new=$(getNetwork)
  if [[ "$old" != "$new" ]]; then
    old=$new
    echo $old
  fi
done
