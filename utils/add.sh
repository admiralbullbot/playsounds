#!/bin/sh

set -e

usage() {
    echo "usage: $0 SAMPLE_NAME SAMPLE_PATH (e.g. $0 doot doot.mp3)"
}

if [ -z "$1" ] || [ -z "$2" ]; then
    usage
    exit 1
fi

SAMPLE_NAME=$1
SAMPLE_PATH=$2

if [ ! -f "$SAMPLE_PATH" ]; then
    echo "No file at $SAMPLE_PATH"
    exit 1
fi

NEW_SAMPLE_DIR="files/$(date +%Y-%m-%d)"
mkdir -p "$NEW_SAMPLE_DIR"

NEW_SAMPLE_PATH="$NEW_SAMPLE_DIR/$SAMPLE_NAME.ogg"

# Convert to ogg
ffmpeg -i "$SAMPLE_PATH" -map_metadata -1 -c:a libopus -b:a 196K "$NEW_SAMPLE_PATH"

echo "Regenerating imports"
./utils/mkimports.sh
