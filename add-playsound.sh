#!/bin/sh

# add-playsound.sh adds a given sample with the link to the playsound database. the link can be a local path, it's put straight into ffmpeg

set -e

# param 1 = sample name
# param 2 = link
usage() {
    echo "usage: $0 sample_name https://link.to.sample.com/sample.mp3"
}

playsound_folder="$(date +%Y-%m-%d)"

if [ -z "$1" ] || [ -z "$2" ]; then
    usage
    exit 1
fi

sample_name="$1"
sample_link="$2"

# Error out if a sample with the given name already exists
for file in files/*/*.ogg; do
    file=$(basename "$file")
    if [ "$file" = "$sample_name.ogg" ]; then
        echo "Sample with name $sample_name already exists, pick a different name"
        exit 1
    fi
done

./convert-playsound.bash "$sample_name" "$sample_link"
mkdir -p "./files/$playsound_folder"
mv "./outputs/$sample_name.ogg" "./files/$playsound_folder/"
./format-add.bash "$playsound_folder" >"./import-files/$playsound_folder.txt"

./generate-index.bash
