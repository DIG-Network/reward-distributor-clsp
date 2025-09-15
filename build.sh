#!/bin/bash

echo "Compiling all .clsp files..."

find . -name "*.clsp" -type f | while read -r file; do
    echo "Source: $file"

    run -i include/ "$file" -d > "${file}.hex"
    echo -n "Hash: "
    opc -H "$(run -i include/ $file)"
done

echo "Done :)"
