#!/bin/bash

systemctl enable iwd.service
systemctl disable NetworkManager
systemctl enable bluetooth.service
systemctl enable cups

systemctl start iwd.service
systemctl start bluetooth.service
systemctl stop NetworkManager
systemctl start cups
