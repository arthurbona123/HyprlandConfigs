#!/bin/bash

mkdir /home/$USER/Downloads
mkdir /home/$USER/Documents
mkdir /home/$USER/Pictures
mkdir /home/$USER/Videos
mkdir /home/$USER/Music
mkdir /home/$USER/AppImages

cp /etc/xdg/waybar /home/$USER/.config/ -r
cp /etc/xdg/nwg-bar /home/$USER/.config/ -r 

mkdir /home/$USER/.config/rofi -pv
rofi -dump-config > /home/$USER/.config/rofi/config.rasi
echo "\n\n\n\n" >> /home/$USER/.config/rofi/config.rasi
rofi -dump-theme >> /home/$USER/.config/rofi/config.rasi

touch /home/$USER/.config/hypr/hypridle.conf
touch /home/$USER/.config/hypr/hyprlock.conf
touch /home/$USER/.config/hypr/hyprpaper.conf
touch /home/$USER/.config/electron-flags.conf
echo -e "--enable-features=UseOzonePlatform\n--ozone-platform=wayland" >> /home/$USER/.config/electron-flags.conf

mkdir /home/$USER/Pictures/backgrounds -pv

sudo mkdir /usr/share/zsh-themes -pv
sudo mkdir /usr/share/zsh-plugins -pv
