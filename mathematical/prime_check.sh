#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1

    # 0 and 1 are not prime numbers
    if [ "$num" -eq 0 ] || [ "$num" -eq 1 ]; then
        echo "Not prime"
        return
    fi

    # 2 is a prime number, but even numbers greater than 2 are not prime
    if [ "$num" -eq 2 ]; then
        echo "Prime"
        return
    elif [ $((num % 2)) -eq 0 ]; then
        echo "Not prime"
        return
    fi

    # Check for factors up to the square root of the number
    local sqrtnum=$(echo "sqrt($num)" | bc)
    for (( i=3; i<=sqrtnum; i+=2 )); do
        if [ $((num % i)) -eq 0 ]; then
            echo "Not prime"
            return
        fi
    done

    echo "Prime"
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <integer>"
    exit 1
fi

# Ensure the input is a positive integer
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a positive integer."
    exit 2
fi

# Check if the number is prime and display result
result=$(is_prime $1)
echo "$1 is $result"
