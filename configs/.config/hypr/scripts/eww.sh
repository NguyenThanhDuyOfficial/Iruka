#!/usr/bin/env bash

eww reload
eww open status

eww update volume="$(~/.config/hypr/scripts/volume.sh)"
eww update backlight="$(~/.config/hypr/scripts/backlight.sh)"
