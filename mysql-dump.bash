#!/bin/bash

# mysql-dump.bash adds all playsounds from the given database

usage() {
    echo "usage: $0 db_name"
}

if [ -z "$1" ]; then
    usage
    exit 1
fi

db_output="$(sudo -u pajbot mysql -u pajbot "$(1)" -N -B -e "SELECT name, link from tb_playsound;)" | tr '\t' ' ' | tr -s ' ')"

readarray -t samples <<<"$db_output"

for sample in "${samples[@]}"; do
    name=$(echo "$sample" | cut -d' ' -f1)
    link=$(echo "$sample" | cut -d' ' -f2)
    ./add-playsound.bash "$name" "$link"
done
