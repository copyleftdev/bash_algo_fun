#!/bin/bash

# Palindrome Check Function
is_palindrome() {
    local str="$1"
    local len=${#str}

    for ((i = 0; i < len / 2; i++)); do
        if [ "${str:$i:1}" != "${str: -$(($i+1)):1}" ]; then
            echo "$str is not a palindrome."
            return
        fi
    done
    echo "$str is a palindrome."
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <string>"
    echo "Example: $0 radar"
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide a single string."
    usage
    exit 1
fi

STR="$1"

# Call is_palindrome function
is_palindrome "$STR"
