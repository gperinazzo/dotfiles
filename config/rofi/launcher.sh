#!/bin/bash
image=$(mktemp --suffix=blured.png)
trap 'rm -f $image' EXIT

maim -f png | convert - -scale "25%" -colorspace gray  - | tee $image | composite -stereo -6-3 - $image $image

feh -FZ $image & 
rofi -combi-modi window,run -show combi
pkill -f "feh.*$image"

