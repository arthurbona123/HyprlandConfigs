#!/bin/bash

pacman -S git 

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S google-chrome pycharm-community-edition code epson-inkjet-printer-escpr sonobus reaper sddm-silent-theme fontbase flatseal ttf-cascadia-nerd ttf-bree-serif sane-airscan
lsp-plugins flatpak firefox kitty udiskie nemo hyprshot hyprland-protocols fuse gcc cmake make qt5ct qt6ct kvantum iwgtk hyprpolkitagent dhcpcd drawing inkscape skanlite gimp vlc virtualbox libreoffice-fresh codeblocks hwinfo vi vim evince cups cups-browsed pavucontrol blueman brightnessctl copyq mysql gamemode qjackctl pipewire-jack zsh openrgb waybar hypridle hyprlock hyprpaper nwg-bar nwg-look nwg-icon-picker rofi gwenview easyeffects

flatpak install steam mangohud obsidian flatseal

wget -4 https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.13.0/ProtonUp-Qt-2.13.0-x86_64.AppImage
wget -4 https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.17.2/Heroic-2.17.2-linux-x86_64.AppImage
wget -4 https://github.com/PCSX2/pcsx2/releases/download/v2.4.0/pcsx2-v2.4.0-linux-appimage-x64-Qt.AppImage
wget -4 https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-9c93ec0bc31bbc94ca4dce2a76ceea80da6f6554/rpcs3-v0.0.37-18022-9c93ec0b_linux64.AppImage

mv ProtonUp-Qt-2.13.0-x86_64.AppImage /home/$USER/AppImages
mv Heroic-2.17.2-linux-x86_64.AppImage /home/$USER/AppImages
mv pcsx2-v2.4.0-linux-appimage-x64-Qt.AppImage /home/$USER/AppImages
mv rpcs3-v0.0.37-18022-9c93ec0b_linux64.AppImage /home/$USER/AppImages
