#!/bin/bash

replace_numbers() {
    local input_file=$1
    local output_file=$2

    sed 's/0/T/g; s/1/R/g; s/2/L/g; s/3/A/g; s/4/M/g; s/5/S/g; s/6/P/g; s/7/E/g; s/8/H/g; s/9/O/g' "$input_file" > "$output_file"
}

find_most_frequent_letter() {
    local file=$1
    tr -d ' \n' < "$file" | fold -w1 | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}'
}

replace_numbers "right_leg_inscription.txt" "right_leg_temp.txt"
replace_numbers "left_leg_inscription.txt" "left_leg_temp.txt"
replace_numbers "right_arm_inscription.txt" "right_arm_temp.txt"
replace_numbers "left_arm_inscription.txt" "left_arm_temp.txt"
replace_numbers "chest_inscription.txt" "chest_temp.txt"
replace_numbers "back_inscription.txt" "back_temp.txt"

right_leg_most_frequent=$(find_most_frequent_letter "right_leg_temp.txt")
right_arm_most_frequent=$(find_most_frequent_letter "right_arm_temp.txt")
left_leg_most_frequent=$(find_most_frequent_letter "left_leg_temp.txt")
back_most_frequent=$(find_most_frequent_letter "back_temp.txt")
chest_most_frequent=$(find_most_frequent_letter "chest_temp.txt")
left_arm_most_frequent=$(find_most_frequent_letter "left_arm_temp.txt")

echo "$right_leg_most_frequent$right_arm_most_frequent$left_leg_most_frequent$back_most_frequent$chest_most_frequent$left_arm_most_frequent" > custodian.txt

rm right_leg_temp.txt left_leg_temp.txt right_arm_temp.txt left_arm_temp.txt chest_temp.txt back_temp.txt

echo "Custodian file generated successfully."
