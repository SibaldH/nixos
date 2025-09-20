#!/usr/bin/env bash

# Function to get the current volume
get_current_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//'
}

# Function to round a number to the nearest multiple of 5
round_to_nearest_5() {
    local volume=$1
    echo $(( (volume + 2) / 5 * 5 ))
}

# Check command line arguments
if [[ "$#" != 1 || ! ("$1" == "inc" || "$1" == "dec" || "$1" == "mute" ) ]]; then
    printf "Usage: $0 [inc|dec|mute]\n"
    exit 1
fi

# Check if pactl is installed
if ! command -v pactl &> /dev/null; then
    echo "Error: pactl is not installed. Please install it and try again."
    exit 1
fi

# Perform volume adjustment
if [[ "$1" == "inc" ]]; then
    current_volume=$(get_current_volume)
    if [ "$current_volume" -lt 150 ]; then
        new_volume=$((current_volume + 5))
        rounded_volume=$(round_to_nearest_5 "$new_volume")
        [ "$rounded_volume" -le 150 ] && pactl set-sink-volume @DEFAULT_SINK@ "$rounded_volume%"
        notify-send -t 1000 "Volume" "Increased to $rounded_volume%"
    fi
elif [[ "$1" == "dec" ]]; then
    current_volume=$(get_current_volume)
    new_volume=$((current_volume - 5))
    rounded_volume=$(round_to_nearest_5 "$new_volume")
    [ "$rounded_volume" -ge 0 ] && pactl set-sink-volume @DEFAULT_SINK@ "$rounded_volume%"
    notify-send -t 1000 "Volume" "Decreaced to $rounded_volume%"
elif [[ "$1" == "mute" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    notify-send -t 1000 "Volume" "$(pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes && echo Muted || echo Unmuted)"
fi
