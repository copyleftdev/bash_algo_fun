#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_filename> <output_filename>"
    exit 1
fi

# Check if the input file exists
if [ ! -f "$1" ]; then
    echo "Error: Input file '$1' not found!"
    exit 2
fi

# Use awk to remove duplicate lines
awk '!seen[$0]++' "$1" > "$2"

echo "Duplicate lines removed from $1 and saved to $2."
