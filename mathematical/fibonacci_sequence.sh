#!/bin/bash

# Function to compute the nth Fibonacci number
fibonacci() {
    local n=$1

    # Base cases
    if [ "$n" -eq 0 ]; then
        echo 0
    elif [ "$n" -eq 1 ]; then
        echo 1
    else
        # Recursive calculation
        echo $(( $(fibonacci $((n-1))) + $(fibonacci $((n-2))) ))
    fi
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number of terms>"
    exit 1
fi

# Ensure the input is a non-negative integer
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a non-negative integer for the number of terms."
    exit 2
fi

# Calculate Fibonacci sequence up to the provided number of terms
for (( i=0; i<$1; i++ )); do
    result=$(fibonacci $i)
    echo -n "$result "
done
echo  # Print a newline after the sequence
