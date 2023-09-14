#!/bin/bash

# Insertion Sort Function
insertion_sort() {
    local -a arr=("${!1}")
    local n=${#arr[@]}

    for ((i = 1; i < n; i++)); do
        key="${arr[$i]}"
        j=$((i-1))

        # Move elements of arr[0..i-1] that are greater than key to one position ahead of their current position
        while [ $j -ge 0 ] && [ "${arr[$j]}" -gt "$key" ]; do
            arr[$((j+1))]=${arr[$j]}
            j=$((j-1))
        done
        arr[$((j+1))]="$key"
    done

    echo "${arr[@]}"
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <array_elements>"
    echo "Example: $0 4 3 2 10 12 1 5 6"
}

# Check for the correct number of arguments
if [ "$#" -lt 1 ]; then
    echo "Error: Please provide the array elements."
    usage
    exit 1
fi

ARRAY=("$@")

# Call insertion_sort function
sorted_array=($(insertion_sort ARRAY[@]))
echo "Sorted array: ${sorted_array[@]}"
