#!/usr/bin/env bash

eww daemon
eww open status

sleep 1

eww update volume="$(~/.config/hypr/scripts/volume.sh)"
eww update backlight="$(~/.config/hypr/scripts/backlight.sh)"
