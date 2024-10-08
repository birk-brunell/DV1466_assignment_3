#!/bin/bash

if [ ! -f "words.txt" ]; then
    echo "Error: File 'words.txt' not found."
    exit 1
fi

count_pattern() {
    grep -o "$1" words.txt | wc -l
}

patterns=("ll" "er" "up" "mm" "ing" "ar")

ascii_chars=()

for pattern in "${patterns[@]}"; do
    count=$(count_pattern "$pattern")
    adjusted_value=$((count + 67))
    octal_value=$(printf '%03o' $adjusted_value)
    escape_sequence="\\$octal_value"
    ascii_char=$(printf "$escape_sequence")
    ascii_chars+=("$ascii_char")
done

echo "${ascii_chars[@]}" | tr -d ' ' | tee ascii.txt

echo "ASCII characters saved to ascii.txt"
