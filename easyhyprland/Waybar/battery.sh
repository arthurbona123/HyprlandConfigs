#!/usr/bin/zsh

dunstify "The battery is low, plug into the AC adapter" -u critical
brightnessctl set 65%
powerprofilesctl set power-saver
