#!/bin/bash

lock_action()
{
        i3-msg 'workspace lock'
}

unlock_action()
{
        i3-msg 'workspace 1'
}

checkpass()
{
        if [ "$(echo "$1" | sha256sum | awk '{print $1;}')" == "$(cat $HOME/.hash)" ]
        then
                echo true
        fi
}

ask()
{
        input=$(echo "" | dmenu -b -p "Input password")
        if [ "$(checkpass "$input")" == "true" ]
        then
                unlock_action
        else
                ask
        fi
}
lock_action
ask
