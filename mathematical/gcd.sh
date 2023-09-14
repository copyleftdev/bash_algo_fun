#!/bin/bash

# Function to compute the GCD of two numbers using Euclid's algorithm
gcd() {
    local a=$1
    local b=$2

    # If the second number is 0, the first number is the GCD
    while [ "$b" -ne 0 ]; do
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo $a
}

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <integer1> <integer2>"
    exit 1
fi

# Ensure the inputs are integers
if [[ ! $1 =~ ^-?[0-9]+$ ]] || [[ ! $2 =~ ^-?[0-9]+$ ]]; then
    echo "Error: Please provide two integer values."
    exit 2
fi

# Calculate GCD and display result
result=$(gcd $1 $2)
echo "GCD of $1 and $2 is: $result"
