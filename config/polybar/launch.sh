#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar
killall -q compton
killall -q feh

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar -c ~/.config/polybar/config.ini top &
		MONITOR=$m polybar -c ~/.config/polybar/config.ini bottom &
	done
else
	polybar -c ~/.config/polybar/config.ini top &
	polybar -c ~/.config/polybar/config.ini bottom &
fi
compton --config ~/.config/compton.conf &

feh --bg-fill ~/.config/background/background.jpg
