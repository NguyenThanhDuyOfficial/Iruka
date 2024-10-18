#!/usr/bin/env bash

getBacklight() {
  brightness=$(brightnessctl -m i | cut -d',' -f4 | tr -d '%')

  if (($brightness == 100)); then
    icon="󰛨"
    class="bright100"
  elif (($brightness > 80)); then
    icon="󱩕"
    class="bright80"
  elif (($brightness > 60)); then
    icon="󱩓"
    class="bright60"
  elif (($brightness > 40)); then
    icon="󱩑"
    class="bright40"
  else
    icon="󱩏"
    class="bright20"
  fi

  echo "{\"class\":\"$class\",\"icon\":\"$icon\"}"
}

getBacklight
