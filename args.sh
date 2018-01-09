#!/bin/bash

# display all command line arguments

count=1

echo "Initial number of args: $#"

while [[ $# -gt 0 ]]; do
    echo "total args left: $#"
    echo "Argument $count = $1"
    count=$((count + 1))
    shift
done