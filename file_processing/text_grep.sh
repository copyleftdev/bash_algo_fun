#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <pattern> <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$2" ]; then
    echo "Error: File '$2' not found!"
    exit 2
fi

# Use grep to search for the pattern in the file
grep "$1" "$2"

