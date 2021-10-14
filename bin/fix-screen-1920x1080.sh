#!/bin/bash

#EDP1="eDP1"
EDP1="eDP-1"
SCALE=${1:-1.25}
OUTPUT=$(xrandr -q | grep -v ${EDP1} | sed -nr 's/^(.+) connected [[:digit:]]+x[[:digit:]]+.*/\1/p')
#OUTPUTS=$(xrandr --listmonitors | sed -En -e 's, ?[[:digit:]]:.+  (.+)$,\1,p')
#WIDTH=$(xrandr -q | grep -v eDP1 | sed -nr 's/^(.+) connected ([[:digit:]]+)x([[:digit:]]+).*/\2/p')
#HEIGHT=$(xrandr -q | grep -v eDP1 | sed -nr 's/^(.+) connected ([[:digit:]]+)x([[:digit:]]+).*/\3/p')
WIDTH=1920
HEIGHT=1080
NWIDTH=$(echo "$WIDTH * $SCALE" | bc | cut -d . -f 1)
NHEIGHT=$(echo "$HEIGHT * $SCALE" | bc | cut -d . -f 1)

echo "Setting output $OUTPUT to ${NWIDTH}x${NHEIGHT} (${SCALE})"
xrandr \
  --output "$OUTPUT" --mode ${WIDTH}x${HEIGHT} --dpi 94 --scale ${SCALE}x${SCALE} --panning ${NWIDTH}x${NHEIGHT}+0+0 \
  --output "${EDP1}" --primary --mode ${WIDTH}x${HEIGHT} --dpi 94 --scale 1x1 --panning ${WIDTH}x${HEIGHT}+${NWIDTH}+0
