#!/bin/bash

# Function to compute factorial
factorial() {
    local num=$1

    # Base case: factorial of 0 is 1
    if [ "$num" -eq 0 ]; then
        echo 1
    else
        # Recursive calculation: n! = n * (n-1)!
        echo $((num * $(factorial $((num-1)))))
    fi
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <non-negative integer>"
    exit 1
fi

# Ensure the input is a non-negative integer
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a non-negative integer."
    exit 2
fi

# Calculate factorial and display result
result=$(factorial $1)
echo "Factorial of $1 is: $result"
