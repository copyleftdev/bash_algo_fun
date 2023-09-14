#!/bin/bash

# Binary Search Function
binary_search() {
    local -a arr=("${!1}")
    local left=0
    local right=${#arr[@]}
    local target=$2

    while [ $left -lt $right ]; do
        local mid=$(( (left + right) / 2 ))

        if [ ${arr[mid]} -eq $target ]; then
            echo "Element $target found at index $mid"
            return
        elif [ ${arr[mid]} -lt $target ]; then
            left=$(( mid + 1 ))
        else
            right=$mid
        fi
    done

    echo "Element $target not found in the array"
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <target> <array_elements>"
    echo "Example: $0 5 1 2 3 4 5 6 7"
}

# Check for the correct number of arguments
if [ "$#" -lt 2 ]; then
    echo "Error: Please provide the target and array elements."
    usage
    exit 1
fi

TARGET=$1
shift
ARRAY=("$@")

# Ensure the array is sorted
IFS=$'\n' SORTED_ARRAY=($(sort -n <<<"${ARRAY[*]}"))
unset IFS

# Call binary_search function
binary_search SORTED_ARRAY[@] $TARGET
