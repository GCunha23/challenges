#!/bin/bash

# Prompts user for input directory path
read -p "Choose directory path: " directory_path

# Checks if directory path exists and, if not, exit
if [ ! -d "$directory_path" ]; then
echo "Error: The chosen directory does not exist."
exit 1
fi

# Prompts user for input permissions number
read -p "Choose permissions number: " permissions_number

# Navigates to the directory input by the user
cd $directory_path

# Changes all files inside it to the input setting, one by one, whith a slight delay detween each file changed
for file in *; do
if [ -f "$file" ]; then
echo "Changing permissions of $file to $permissions_number"
chmod "$permissions_number" "$file"
sleep 1
fi
done

# Prints to the screen the directory contents and the new permissions settings of everything in the directory
ls -l
echo "$(date) Successfuly changed permissions number to $permissions_number on all files inside $directory_path"

#  Outputs a log file of all actions that were taken by the script
echo "$(date) Successfuly changed permissions number to $permissions_number on all files inside $directory_path" >> permissions_log.txt
