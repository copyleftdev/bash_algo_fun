#!/bin/bash

# Function to display usage of the script
usage() {
    echo "Usage: $0 [password_length]"
    echo "Default password length is 12 if not specified."
}

# Check for more than one argument
if [ "$#" -gt 1 ]; then
    echo "Error: Too many arguments."
    usage
    exit 1
fi

# Set password length, default to 12 if not provided
PASSWORD_LENGTH=${1:-12}

# Ensure the provided length is a number
if ! [[ "$PASSWORD_LENGTH" =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a valid number for password length."
    usage
    exit 2
fi

# Generate the password
PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*' | fold -w $PASSWORD_LENGTH | head -n 1)

echo "Generated Password: $PASSWORD"
