#!/usr/bin/zsh

if (grim -g "$(slurp -d)"); then

    dunstify "The screenshot are saved in '/home/$(echo $USER)/'"

else 

    break

fi
