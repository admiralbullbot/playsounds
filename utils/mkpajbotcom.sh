#!/bin/bash

DOMAIN="https://playsound.pajbot.com"

for f in files/**/*.ogg; do
    SAMPLENAME=$(basename $(echo $f | sed -r 's/\.ogg//'))

    echo "Sample('$SAMPLENAME', '$DOMAIN/$f'),"
done
