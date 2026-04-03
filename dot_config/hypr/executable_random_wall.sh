#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/gruvbox"

awww query || awww-daemon &

sleep 2

RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

awww img "$RANDOM_WALL" --transition-type wipe --transition-angle 30 --transition-step 90
