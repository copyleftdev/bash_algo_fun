#!/bin/bash

# String Reverse Function
string_reverse() {
    local str="$1"
    local reversed=""

    for ((i=${#str}-1; i>=0; i--)); do
        reversed="$reversed${str:$i:1}"
    done

    echo "$reversed"
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <string>"
    echo "Example: $0 hello"
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide a single string."
    usage
    exit 1
fi

STR="$1"

# Call string_reverse function
reversed_str=$(string_reverse "$STR")
echo "Reversed string: $reversed_str"
