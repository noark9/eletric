#!/usr/bin/env bash
# vim: ts=4 et

# Audit script.
# This script requires Bash 4 due to the associative arrays.

# Declare variables for the programs to be used.
SHA256SUM="sha256sum"

# sha_hash calculates the sha256 hash of the first argument.
sha_hash() {
    echo -n "$1" | $SHA256SUM - | awk '{ print $1 }'
}

# Create a dictionary or associative array to store user details.
declare -A users

# Read from stdin and split based on the IFS (internal field separator)
# and take the fields as user and password in order.
while IFS=':' read -r USER PASSWORD
do
    # Add the fields to the associative array.
    users+=(["${USER}"]="${PASSWORD}")
done < /dev/stdin

# Iterate the dictionary and display it.
for i in "${!users[@]}"
do
    # Echo and enable tabs (-e)
    echo -e "user:" "$i" "\tpassword:" "${users[$i]}"
done
