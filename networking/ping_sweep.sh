#!/bin/bash

# Function to display usage of the script
usage() {
    echo "Usage: $0 <subnet>"
    echo "Example: $0 192.168.1"
}

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide a subnet."
    usage
    exit 1
fi

SUBNET=$1

# Ping sweep
for IP in $(seq 1 254); do
    ping -c 1 $SUBNET.$IP &>/dev/null
    
    # Check the return code of the ping command
    if [ "$?" -eq 0 ]; then
        echo "$SUBNET.$IP is up."
    else
        echo "$SUBNET.$IP is down."
    fi
done
