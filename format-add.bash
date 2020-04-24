#!/bin/bash

set -e

usage() {
    echo "usage: $0 foldername [action] (e.g. $0 2019-05-15)"
}

if [ -z "$1" ]; then
    usage
    exit 1
fi

foldername="$1"
action=${2:-add}

shopt -s nullglob
for filename in "files/$foldername"/*.ogg; do
    filename="$(basename "$filename")"
    playsound_name="$(basename "$filename" '.ogg')"
    echo "!$action playsound $playsound_name https://admiralbullbot.github.io/playsounds/files/$foldername/$filename"
done
