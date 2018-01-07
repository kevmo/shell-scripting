#!/bin/bash

# Get user info using $IFS internal field Separator
# Basically, just set a new delimiter with which to parse file

FILE='/etc/passwd'

read -p "Enter a username > " user_name

file_info=$(grep "^$user_name:" $FILE)

if [ -n "$file_info" ]; then

    IFS=":" read user pw uid gid name home shell <<< "$file_info"
    echo "User = '$user'"
    echo "UID = '$uid'"
    echo "GID = '$gid'"
    echo "Name = '$name'"
    echo "Home dir = '$home'"
    echo "shell = '$shell'"

else
    echo "No such user '$user_name'" >&2
    exit 1
fi
