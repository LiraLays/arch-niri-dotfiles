#!/bin/bash
SELECTION="$(printf "󰐥 Shutdown\n󰑓 Reboot\n Lock\n󰍃 Logout\n Suspend" | fuzzel --dmenu -l 6 -p "BYE!")"

case $SELECTION in
*"Lock")
swaylock;;
*"Suspend")
systemctl suspend;;
*"Log out")
#sudo pkill -u $USER;;
                #hyprctl dispatch exit 1;;
                #qtile cmd-obj -o cmd -f shutdown;;
                #swaymsg exit;;
                riverctl exit;;
*"Reboot")
systemctl reboot;;
*"Shutdown")
systemctl poweroff;;
esac
