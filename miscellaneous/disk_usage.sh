#!/bin/bash

# Function to display usage of the script
usage() {
    echo "Usage: $0 [directory]"
    echo "If no directory is specified, the current directory is used."
}

# Check if more than one argument is passed
if [ "$#" -gt 1 ]; then
    echo "Error: Too many arguments."
    usage
    exit 1
fi

# If no directory is specified, default to the current directory
DIR=${1:-.}

# Check if the specified directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory $DIR does not exist."
    exit 2
fi

# Display disk usage using the 'du' command
echo "Disk usage for $DIR:"
du -sh "$DIR"/*

