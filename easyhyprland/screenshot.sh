#!/usr/bin/zsh

grim -g"$(slurp -d)"
dunstify "The screenshot are saved in '/home/$(echo $USER)/'"