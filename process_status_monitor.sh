#!/bin/bash

# Author : Deep Pandya
# Date : 03/08/2023
# Purpose : Monitor a specific script in linux.

# For example: ./monitor_process.sh <process_name>.


function check_process_status {
    # pgrep looks through the currently running processes and lists the process IDs which match the selection crite‐ria to stdout.
    pgrep -x "$1"
    if [ $? == 0 ];then
        echo $1 is running
        return 0
    else
        return 1
    fi
}

function restart_process {
    retry_count=$2

    for ((i=0; i<=retry_count; i++)); do
        sudo systemctl start $1
        sleep 3s
        
        if check_process_status $1 ; then
            echo $1 is started
            return 0
            break
        fi    
    done
    return 1
}

if [[ $# -eq 0 ]]; then
    echo "Please provide the process name."
    echo $0 "<process name>"
    exit;
fi

if check_process_status $1; then 
# If return value is 0 then enter in IF condition.
    echo $1 is running
else
    echo $1 is not running
    restart_process $1 3 -eq 1
fi
