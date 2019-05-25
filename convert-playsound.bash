#!/bin/bash

mkdir -p outputs

input="$(echo "$@" | tr -s ' ')"

name="$(echo "$input" | cut -d' ' -f1)"
link="$(echo "$input" | cut -d' ' -f2)"

ffmpeg -loglevel warning -y -i "$link" -map_metadata -1 -c:a libopus -b:a 196K "outputs/$name.ogg" 1>/dev/null 2>&1
