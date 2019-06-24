#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar
killall -q compton
killall -q feh

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -c ~/.config/polybar/config.ini top &
polybar -c ~/.config/polybar/config.ini bottom &
compton --config ~/.config/compton.conf &

feh --bg-fill ~/.config/background/background.jpg
