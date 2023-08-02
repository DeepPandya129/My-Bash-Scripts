#!/bin/bash

# Author : Deep Pandya
# Date : 01/08/2023
# Purpose : This script will show all the directories and files present in current directory 
# Backup created and only keep latest 3 backup file and older will be deleted.


# How to run script
# CMD : ./backup_script.sh <source> <desti>

function display_usage {
    echo Usage:
    echo Example : $PWD 
    echo
}

# Rotation
# Function to perform the rotation and keep only the last 3 backups
function perform_rotation {
    echo Backup are present at location : $dest_dir
    cd $dest_dir
    get_total_count=$(ls -lt | grep 'back*' | wc -l)
    deletion_count=$(($get_total_count - 3))

    if [[ $get_total_count -gt 3 ]]; then
        ls -lt | tail -$deletion_count | awk '{print $NF}' | xargs rm -rf

        if [[ $? -eq 0 ]]; then
            echo Deletion completed!!!
        fi
    fi
}

# Argument validation
if [[ $# -eq 0 || $1 = "" || $2 = "" ]]; then
    echo Enter valid argument:
    display_usage
    exit 1
fi

timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
src_dir=$1
dest_dir=$2

tar -zcf $dest_dir/backup_$timestamp.tar.gz $src_dir

if [[ $? -eq 0 ]]; then
    echo Backup complited!!
    perform_rotation
else
    echo Backup Not complited!!
fi
