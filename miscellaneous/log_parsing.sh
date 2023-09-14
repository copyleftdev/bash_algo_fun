#!/bin/bash

# Function to display usage of the script
usage() {
    echo "Usage: $0 <path_to_log_file>"
}

# Check for correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Error: Provide the path to the log file."
    usage
    exit 1
fi

LOG_FILE=$1

# Ensure the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file $LOG_FILE does not exist."
    exit 2
fi

# Parse logs
echo "Requests per IP:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo -e "\nMost accessed URLs:"
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -10

echo -e "\nHTTP status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr

