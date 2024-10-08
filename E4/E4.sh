#!/bin/bash

output_file="rearranged_rings.txt"

> "$output_file"

while IFS= read -r line; do
    words=($line)

    ing_word=$(echo "${words[@]}" | grep -o '\b\w*ing\b')
    ed_word=$(echo "${words[@]}" | grep -o '\b\w*ed\b')
    es_word=$(echo "${words[@]}" | grep -o '\b\w*es\b')

    echo "$ing_word $ed_word $es_word" | tee -a "$output_file"
done < "rings.txt"

echo "Rearranged content saved to $output_file"
