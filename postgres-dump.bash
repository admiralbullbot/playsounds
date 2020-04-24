#!/bin/bash

# mysql-dump.bash adds all playsounds from the given database

usage() {
    echo "usage: $0 schema_name"
}

if [ -z "$1" ]; then
    usage
    exit 1
fi

db_output="$(psql -t -P pager=off -c "SELECT name, link from $1.playsound;" | tr '\t' ' ' | tr -s ' ')"

readarray -t samples <<<"$db_output"

for sample in "${samples[@]}"; do
    name=$(echo "$sample" | cut -d' ' -f2)
    link=$(echo "$sample" | cut -d' ' -f4)

    ./add-playsound.sh "$name" "$link"
done
