#!/bin/bash

hash_file="$HOME/.hash"

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
        gethash "$1"
        if [ "$hash" == "$(cat $hash_file)" ]
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

newpass()
{
        echo -n "Enter new password: "; read np; \
                        gethash "$np" ; echo "$hash" > $hash_file
}

gethash()
{
        hash=$(echo "$1" | sha256sum | awk '{print $1;}')
}

addpass()
{
        if [ -f $hash_file ] ; then
                echo -n "Enter current password: "; read p
                 if [ "$(checkpass "$p")" == "true" ]; then
                        newpass
                 else
                        echo "Wrong password"; exit 0
                 fi
        else
                newpass
        fi
}

case $1 in
        add) addpass;;
        *) lock_action; ask;;
esac
