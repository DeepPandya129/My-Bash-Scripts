#!/bin/bash

# Author : Deep Pndya
# Date : 01/08/2023
# Purpose : This script will show all the directories and files present in current directory 

<<Multi_Line_Comment
Part 1: File and Directory Exploration
Upon execution without any command-line arguments, the script will display a welcome message and list all the files and directories in the current path.
For each file and directory, the script will print its name and size in human-readable format (e.g., KB, MB, GB). This information will be obtained using the ls command with appropriate options.
The list of files and directories will be displayed in a loop until the user decides to exit the explorer.

Part 2: Character Counting
After displaying the file and directory list, the script will prompt the user to enter a line of text.
The script will read the user's input until an empty string is entered (i.e., the user presses Enter without any text).
For each line of text entered by the user, the script will count the number of characters in that line.
The character count for each line entered by the user will be displayed.
Multi_Line_Comment

# PART 1
# Display Welcome message
echo "---------------------------------------------------------------------------"
echo -e "\tWelcome to the Interactive File and Directory Explorer!"
echo "---------------------------------------------------------------------------"
echo "Files and Directories in the Current Path: "

# Display size of all file and dir with size.

ls -hl | awk '{if(NR>1)print $NF,"size =",$5}'

# PART 2

while true; 
do
    read -p "ENter string and I'll give you string count :  " input
    char_count=$(echo $input | wc -c)
    
    if [ -z "$char_count" ]; then
        echo exiting from loop
        break
    else
        echo "$char_count Characters found."
    fi
done
