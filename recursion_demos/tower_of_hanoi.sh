#!/bin/bash

# Function for Tower of Hanoi
tower_of_hanoi() {
    local num_disks=$1
    local from_peg=$2
    local to_peg=$3
    local aux_peg=$4

    # If only one disk, make the move and return
    if [ $num_disks -eq 1 ]; then
        echo "Move disk 1 from peg $from_peg to peg $to_peg"
        return
    fi

    # Move top n-1 disks from A to B using C as auxiliary
    tower_of_hanoi $((num_disks-1)) $from_peg $aux_peg $to_peg

    # Move remaining disks from A to C
    echo "Move disk $num_disks from peg $from_peg to peg $to_peg"

    # Move n-1 disks from B to C using A as auxiliary
    tower_of_hanoi $((num_disks-1)) $aux_peg $to_peg $from_peg
}

# Function to display usage of the script
usage() {
    echo "Usage: $0 <number_of_disks>"
    echo "Example: $0 3"
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide the number of disks."
    usage
    exit 1
fi

# Ensure the provided number of disks is a number
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a valid number for number of disks."
    usage
    exit 2
fi

# Call tower_of_hanoi function
tower_of_hanoi $1 "A" "C" "B"
