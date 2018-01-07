#!/bin/bash

# read-validate: validate input

invalid_input() {
    echo "Invalid input '$REPLY'" >&2
    exit 1
}


read -p "Enter a *single* item > "

# empty
[[ -z $REPLY ]] && invalid_input

# multiple items
(( $(echo $REPLY | wc -w) > 1)) && invalid_input

# valid filename?
if [[ $REPLY =~ ^[-[:alnum:]\._]+$ ]]; then
    echo "'$REPLY' is a valid filename."

    if [[ -e $REPLY ]]; then
        echo "And file '$REPLY' exists."
    else
        echo "File '$REPLY' does not exist."
    fi

    # is input a floating point number?
    if [[ $REPLY =~ ^-?[[:digit:]]*\.[[:digit:]]+? ]]; then
        echo "'$REPLY' is a floating point number."
    else
        echo "'$REPLY' is not a floating point number."
    fi


    # integer
    if [[ $REPLY =~ ^-?[[:digit:]]+$ ]]; then
        echo "'$REPLY' is an integer."
    else
        echo "'$REPLY' is not an integer."
    fi

else
    echo "'$REPLY' is not a valid filename."
fi