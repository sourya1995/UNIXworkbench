#!/usr/bin/env bash
# File: guessinggame.sh

# Function : get a number of files in the current directory
# Arguments: none

function get_current_file_num {
    local file_num=$(ls -al | wc -l)
    file_num=$(expr $file_num - 1) # subtract the number of total line from the number of files
    echo $file_num
}

# Function : judge the user's guess number is correct or not
# Arguments: $1: User's guess number
#            $2: Correct file numbers

function judge_user_input {
    local user_input=$1
    local file_num=$2

    if [[ $user_input -lt $file_num ]]
    then
        echo "Your input number is too low." >&2
        echo 1
    elif [[ $user_input -gt $file_num ]]
    then
        echo "Your input number is too high." >&2
        echo 1
    else
        echo "Congratulation!!" >&2
        echo 0
    fi
}

# echo the question
echo "How many files in the current directory?"

# initialize variables
file_num=$(get_current_file_num)
status=1

while [[ $status -eq 1 ]]
do
    echo -n "Your answer> "
    read user_input
    status=$(judge_user_input $user_input $file_num)
done