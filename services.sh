#!/bin/bash

systemctl enable iwd.service
systemctl disable NetworkManager
systemctl enable bluetooth.service
systemctl enable cups
systemctl enable swayosd-libinput-backend.service
systemctl enable dhcpcd
systemctl enable tlp

systemctl start iwd.service
systemctl start bluetooth.service
systemctl stop NetworkManager
systemctl start cups
systemctl start swayosd-libinput-backend.service
systemctl start dhcpcd
