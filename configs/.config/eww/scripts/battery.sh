#!/usr/bin/env bash

getBattery() {
  status=$(cat /sys/class/power_supply/BAT0/status)
  capacity=$(cat /sys/class/power_supply/BAT0/capacity)

  if [[ "$status" == "Full" ]]; then
    echo "{\"class\":\"full\",\"icon\":\"󰂄\"}"
    return
  fi

  icons=(󰁻 󰁽 󰁿 󰂁 󰂆 󰂈 󰂉 󰂊)
  classNames=("veryLow" "low" "normal" "high" "veryLowCharging" "lowCharging" "normalCharging" "highCharging")

  if (($capacity >= 80)); then
    index=3
  elif (($capacity >= 60)); then
    index=2
  elif (($capacity >= 40)); then
    index=1
  else
    index=0
  fi

  if [[ "$status" == "Charging" ]]; then
    index=$((index + 4))
  fi

  icon=${icons[index]}
  class=${classNames[index]}

  echo "{\"class\":\"$class\",\"icon\":\"$icon\"}"
}

old=$(getBattery)
echo $old

while true; do

  new=$(getBattery)
  if [[ "$old" != "$new" ]]; then
    old=$new
    echo $old
  fi

  sleep 60
done
