#!/usr/bin/env bash

# Checking and installing dependencies
dependencies=("slurp" "grim" "magick" "swappy" "wl-copy" "wl-paste" "hyprctl" "jq")
for dep in "${dependencies[@]}"; do
    command -v "$dep" &> /dev/null || { echo "$dep not found, please install it."; exit 1; }
done

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "area" || "$1" == "window" || "$1" == "monitor") ]]; then
    printf "Usage: %s [area|window|monitor]\n" "$0" >&2
    exit 1
fi

# Determine capture geometry based on mode
case "$1" in
    "area")
        geometry="$(slurp)"
        mode="Area"
        ;;
    "window")
        geometry="$(hyprctl activewindow -j | jq -r '.at[0],.at[1],.size[0],.size[1]' | paste -sd ',' - | awk -F',' '{print $1 "," $2 " " $3 "x" $4}')"
        mode="Window"
        ;;
    "monitor")
        geometry="$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .x,.y,.width,.height' | paste -sd ',' - | awk -F',' '{print $1 "," $2 " " $3 "x" $4}')"
        mode="Monitor"
        ;;
esac

# Exit if geometry is empty (e.g., no active window or monitor)
if [[ -z "$geometry" ]]; then
    echo "Error: Could not determine capture geometry for $1 mode." >&2
    exit 1
fi

# Capture screenshot, process, and copy to clipboard
grim -g "$geometry" - | magick - -shave 2x2 PNG:- | wl-copy

# Notify screenshot has been copied
notify-send -t 3000 -u low -a screenshot "$mode screenshot copied to clipboard"

# Paste to clipboard and use swappy for further processing
wl-paste | swappy -f -
