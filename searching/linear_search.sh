#!/bin/bash

# Linear Search Function
linear_search() {
    local -a arr=("${!1}")
    local target=$2

    for i in "${!arr[@]}"; do
        if [ "${arr[$i]}" -eq "$target" ]; then
            echo "Element $target found at index $i"
            return
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

# Call linear_search function
linear_search ARRAY[@] $TARGET
