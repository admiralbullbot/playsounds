#!/bin/sh

set -e

if [ -z $DOMAIN ]; then
    DOMAIN="https://playsound.pajbot.com"
    echo "Defaulting to domain $DOMAIN"
fi

mkdir -p imports

for dir in files/*; do
    DIR_NAME=$(echo $dir | sed -r 's/files\///')
    echo $DIR_NAME
    IMPORT_FILE_PATH="imports/$DIR_NAME.txt"
    rm -f $IMPORT_FILE_PATH
    for f in $dir/*.ogg; do
        SAMPLE_PATH=$(echo $f | sed -r 's/files\///')
        SAMPLE_NAME=$(basename $(echo $f | sed -r 's/\.ogg//'))
        SAMPLE_URL="$DOMAIN/$SAMPLE_PATH"
        echo "!add playsound $SAMPLE_NAME $SAMPLE_URL" >> $IMPORT_FILE_PATH
    done
done
