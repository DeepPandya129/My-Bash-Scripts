#!/bin/bash

# Author : Deep Pandya
# Date : 01/08/2023
# Purpose : This script will show all the directories and files present in current directory 

# RUN : ./backup_script.sh /mnt/d/linux /mnt/d/temp_bash

function display_usage {
    echo Usage:
    echo Example : $PWD 
    echo
}
if [[ $# -eq 0 || $1 = "" || $2 = "" ]]; then
    echo Enter valid argument:
    display_usage
    exit 1
fi

timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
src_dir=$1
dest_dir=$2/backup_$timestamp.tar.gz

tar -zcf $dest_dir $src_dir

if [[ $? -eq 0 ]]; then
    echo Backup complited!!
else
    echo Backup Not complited!!
fi
