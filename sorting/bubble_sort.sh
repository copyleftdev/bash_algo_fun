#!/bin/bash

# Bubble Sort Function
bubble_sort() {
    local -a arr=("${!1}")
    local n=${#arr[@]}

    for ((i = 0; i < n-1; i++)); do
        for ((j = 0; j < n-i-1; j++)); do
            if [ "${arr[$j]}" -gt "${arr[$j+1]}" ]; then
                # Swap arr[j] and arr[j+1]
                local temp=${arr[$j]}
                arr[$j]=${arr[$j+1]}
                arr[$j+1]=$temp
            fi
        done
    done

    echo "${arr[@]}"
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <array_elements>"
    echo "Example: $0 64 34 25 12 22 11 90"
}

# Check for the correct number of arguments
if [ "$#" -lt 1 ]; then
    echo "Error: Please provide the array elements."
    usage
    exit 1
fi

ARRAY=("$@")

# Call bubble_sort function
sorted_array=($(bubble_sort ARRAY[@]))
echo "Sorted array: ${sorted_array[@]}"
