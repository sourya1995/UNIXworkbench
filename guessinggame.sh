#! /usr/bin/env bash

function guessing{
    correct_answer = $(ls -l | grep "^-" | wc -l)
    while true;
    do
        echo "please enter your guess"
        read number
        if [[ $number -lt $correct_answer ]]
        then
            echo "Your guess is lesser than the number."
        elif [[ $number -gt $correct_answer ]]
        then
            echo "Your guess is greater than the number."
        else
            echo "Congrats, you're right!"
        fi 
    done
}

echo "guess the file number in the current directory"
guessing