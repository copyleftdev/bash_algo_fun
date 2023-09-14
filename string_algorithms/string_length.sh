#!/bin/bash

# String Length Function
string_length() {
    local str="$1"
    echo "${#str}"
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

# Call string_length function
length=$(string_length "$STR")
echo "The length of '$STR' is $length characters."
