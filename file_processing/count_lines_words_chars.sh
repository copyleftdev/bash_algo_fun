#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found!"
    exit 2
fi

# Count lines, words, and characters using wc
lines=$(wc -l < "$1")
words=$(wc -w < "$1")
chars=$(wc -c < "$1")

echo "File: $1"
echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"

