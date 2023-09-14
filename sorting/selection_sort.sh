#!/bin/bash

# Selection Sort Function
selection_sort() {
    local -a arr=("${!1}")
    local n=${#arr[@]}

    for ((i = 0; i < n-1; i++)); do
        min_idx=$i
        for ((j = i+1; j < n; j++)); do
            if [ "${arr[$j]}" -lt "${arr[$min_idx]}" ]; then
                min_idx=$j
            fi
        done

        # Swap the found minimum element with the first element
        local temp=${arr[$i]}
        arr[$i]=${arr[$min_idx]}
        arr[$min_idx]=$temp
    done

    echo "${arr[@]}"
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <array_elements>"
    echo "Example: $0 64 25 12 22 11"
}

# Check for the correct number of arguments
if [ "$#" -lt 1 ]; then
    echo "Error: Please provide the array elements."
    usage
    exit 1
fi

ARRAY=("$@")

# Call selection_sort function
sorted_array=($(selection_sort ARRAY[@]))
echo "Sorted array: ${sorted_array[@]}"
