#/bin/sh

if [ -f "/usr/bin/swayidle" ]; then
	echo "swayidle is installed."
	swayidle -w timeout 300 'swaylock -f' timeout 360 'niri msg action power-off-monitors' resume 'niri msg action power-on-monitors'
else
	echo "swayidle not installed."
fi;
