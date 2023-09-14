#!/bin/bash

# Function to display usage of the script
usage() {
    echo "Usage: $0 <target_ip> <start_port> <end_port>"
    echo "Example: $0 192.168.1.10 1 100"
}

# Check for the correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Error: Please provide the target IP and port range."
    usage
    exit 1
fi

TARGET_IP=$1
START_PORT=$2
END_PORT=$3

# Ensure the provided ports are numbers
if ! [[ "$START_PORT" =~ ^[0-9]+$ ]] || ! [[ "$END_PORT" =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide valid numbers for start and end ports."
    usage
    exit 2
fi

# Port scanning using netcat (nc)
for PORT in $(seq $START_PORT $END_PORT); do
    # Using the "-z" option to specify zero I/O mode (used for scanning) and "-w1" for a 1 second timeout.
    nc -z -w1 $TARGET_IP $PORT &>/dev/null

    if [ "$?" -eq 0 ]; then
        echo "Port $PORT is open."
    fi
done
