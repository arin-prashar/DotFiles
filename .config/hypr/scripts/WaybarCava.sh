#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# Not my own work. This was added through Github PR. Credit to original author

#----- Optimized bars animation without much CPU usage increase --------
bar="▁▂▃▄▅▆▇█"
dict="s/;//g"

# Calculate the length of the bar outside the loop
bar_length=${#bar}

# Create dictionary to replace char with bar
for ((i = 0; i < bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

# Create cava config
config_file="/tmp/bar_cava_config"
cat >"$config_file" <<EOF
[general]

mode = scientific
framerate = 120
bars = 10

[input]

method = pipewire
; source = alsa:pcm:3:front:3:playback
source = auto

[output]
method = ncurses
data_format = ascii
ascii_max_range = 7

[color]

gradient = 1

gradient_count = 8
gradient_color_1 = '#030508'
gradient_color_2 = '#2A3859'
gradient_color_3 = '#324166'
gradient_color_4 = '#11606B'
gradient_color_5 = '#BCADBB'
gradient_color_6 = '#2B7F48'
gradient_color_7 = '#16808F'
gradient_color_8 = '#BCADBB'

[color]
[smoothing]

integral = 77
monstercat = 1
waves = 0

gravity = 100

EOF


# Kill cava if it's already running
# pkill -f "cava -p $config_file"
pkill -f "cava"
# Read stdout from cava and perform substitution in a single sed command
# cava -p "$config_file" | sed -u "$dict"
cava
