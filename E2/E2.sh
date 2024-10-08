#!/bin/bash

if [ ! -f "poem.txt" ]; then
    echo "Error: poem.txt not found!"
    exit 1
fi

grep -o '\b[A-Z][a-zA-Z]*\b' "poem.txt" | tee decoded_poem.txt

echo "Decoded content saved to decoded_poem.txt"
