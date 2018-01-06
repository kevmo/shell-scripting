#!/bin/bash

# test-string: evaluate the value of a string

ANSWER=maybe

if [ -z "$ANSWER" ]; then
    echo "There is no answer." >&2
    exit 1
fi

if [ "$ANSWER" = "yes" ]; then
    echo "The answer is $ANSWER"
elif [ "$ANSWER" = "no" ]; then
    echo "The answer is $ANSWER."
elif [ "$ANSWER" = "maybe" ]; then
    echo "The answer is $ANSWER."
else
    echo "The answer is unknown."
fi
