#!/bin/bash

# Function to display usage of the script
usage() {
    echo "Usage: $0 <source_directory> <backup_destination>"
}

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    usage
    exit 1
fi

SRC_DIR=$1
BACKUP_DIR=$2
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Check if source directory exists
if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory $SRC_DIR does not exist."
    exit 2
fi

# Check if backup directory exists, if not, create it
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Create a tarball and store in the backup directory
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SRC_DIR"

# Check if tar command was successful
if [ $? -eq 0 ]; then
    echo "Backup successful! Backup saved as $BACKUP_DIR/$BACKUP_NAME"
else
    echo "Backup failed."
    exit 3
fi
