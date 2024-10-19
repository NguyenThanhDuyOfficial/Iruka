#!/usr/bin/env bash

getVolume() {
  volume=$(pamixer --get-volume)
  mute=$(pamixer --get-mute)
  icons=(󰕿 󰖀 󰕾 󰝟)

  if [[ "$mute" == "true" ]]; then
    icon="󰝟"
    class="volumeMute"
  else
    if (($volume > 90)); then
      icon="󰕾"
      class="volumeHigh"
    elif (($volume > 60)); then
      icon="󰖀"
      class="volumeNormal"
    else
      icon=󰕿
      class="volumeLow"
    fi
  fi

  echo "{\"class\":\"$class\",\"icon\":\"$icon\"}"
}

getVolume
