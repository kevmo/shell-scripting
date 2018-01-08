#!/bin/bash

# A menu-driven system information program

clear
echo "
What do you want to see?

1. System Information
2. Disk Space
3. Home Space Utilization
0. Quit
"

read -p "Enter selection [0-3] >>> "

if [[ $REPLY =~ ^[0-3]$ ]]; then
    if [[ $REPLY == 0 ]]; then
        echo "Program terminated."
        exit
    fi

    if [[ $REPLY == 1 ]]; then
        echo "Hostname: $HOSTNAME"
        uptime
        exit
    fi

    if [[ $REPLY == 2 ]]; then
        echo "DISK SPACE \n \n"
        df - h
        exit
    fi

    # this takes a while
    if [[ $REPLY == 3 ]]; then
        if [[ $(id) -eq 0 ]]; then
            echo "user: root"
            du -sh /home
        else
            echo "user: $USER"
            du -sh $HOME
        fi
        exit
    fi

else
    echo "Invalid entry.  Options are 0-3." >&2
    exit 1

fi
