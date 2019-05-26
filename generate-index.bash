#!/bin/bash

rm -f import-files/README.md
touch import-files/README.md

echo "# import-files
This file contains all available import files.  " > import-files/README.md

for path in import-files/*.txt; do
    filename="$(basename "$path")"
    echo " * [$filename](/playsounds/$path)" >> import-files/README.md
done
