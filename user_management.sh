#!/bin/bash

# Author : Deep Pandya
# Date : 02/08/2023
# Purpose : Perform User management in linux.

function display_usage {
    echo "Usage: $0 [Option]"
    echo "-c ,--create      New user create"
    echo "-d ,--delete      New user create"
    echo "-l ,--list        List all users"
    echo "-r ,--reset      Reset password for user"
    echo "-h ,--help      Help menu"
}

function create_user {
    read -p 'Enter username: ' username
    echo "";
    # check if user present or not.
    if id $username >/dev/null 2>&1; then
        echo user already exist
        exit 1
    else
        sudo useradd -m $username
        sudo passwd $username
        echo USER Created!!
    fi
}
function delete_user {
    read -p 'Enter username: ' username
    echo "";
    id $username >/dev/null 2>&1 # check if user present or not.
    if [[ $? -eq 0 ]]; then
        sudo userdel -r $username
        echo USER Deleted!!
    else
        echo user not exist
        exit 1
    fi
}

function reset_passwd {
    read -p 'Enter username: ' username
    echo "";
    id $username > /dev/null 2>&1 # check if user present or not.
    if [[ $? -eq 0 ]]; then
        sudo passwd $username
    fi
}

function list_user {
    sudo cat /etc/passwd | awk -F: '{print $1,"UID :",$3}'
}   

if [[ -z $@ ]]; then
    display_usage
fi

option=$1
case $option in
    '-c' | '--create')
    create_user  
    ;;

    '-d' | '--delete')
    delete_user
    ;;

    '-r' | '--reset')
    reset_passwd
    ;;
    
    '-l' | '--list')
    list_user
    ;;

    *)
    echo "Please enter a valid option"
    display_usage
    exit 1
    ;;

esac
