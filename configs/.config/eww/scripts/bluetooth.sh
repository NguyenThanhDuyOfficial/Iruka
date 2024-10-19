#!/usr/bin/env bash

getBluetooth() {
  bluetooth=$(bluetoothctl devices Connected)

  if [[ -z $bluetooth ]]; then
    icon="󰂲"
    class="blueDisconnect"
  else
    icon="󰂱"
    class="bluetooth"
  fi

  echo "{\"class\":\"$class\",\"icon\":\"$icon\"}"
}

old=$(getBluetooth)
echo $old

while true; do
  sleep 5

  new=$(getBluetooth)
  if [[ "$old" != "$new" ]]; then
    old=$new
    echo $old
  fi
done
