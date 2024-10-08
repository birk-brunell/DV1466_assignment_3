#!/bin/bash

generate_content() {
    local lines=$1
    local letters_per_line=$2
    < /dev/urandom tr -dc 'a-zA-Z' | fold -w $letters_per_line | head -n $lines | sed 's/./& /g' | sed 's/ $//'
}

generate_content 70 20 > right_leg_inscription.txt
generate_content 70 20 > left_leg_inscription.txt

generate_content 40 15 > right_arm_inscription.txt
generate_content 40 15 > left_arm_inscription.txt

generate_content 15 40 > chest_inscription.txt

generate_content 35 40 > back_inscription.txt

echo "Inscription files generated successfully."
