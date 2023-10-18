#!/bin/bash
#Script:        Ops Challenge 05
#Author:        Gonçalo Cunha
#Date of latest revision:       13/10/2023
#Purpose:       Clearing logs


#Variables
backup_dir=/var/log/backups
file_to_compress=/var/log/wtmp
timestamp=$(date +"%Y%m%d%H%M%S")
compressed_file=$backup_dir/$(basename "$file_to_compress")_$timestamp.gz


#Prints the file size of the log file in bytes
stat -c %s /var/log/wtmp


#Compresses the contents of the log file to a backup directory, with a timestamp on the file name
mkdir -p "$backup_dir"
gzip -k "$file_to_compress" > "$compressed_file"


#Get the sizes of the original and compressed files
original_size=$(stat -c %s "$file_to_compress")
compressed_size=$(stat -c %s "$compressed_file")


#Prints to screen the file size of the compressed file
stat -c %s "$compressed_file"


#Compares the size of the compressed files to the size of the original log files
echo "Original file size: "$original_size" bytes"
echo "Compressed file size: "$compressed_size" bytes"


#Clears the contents of the log file
truncate -s 0 "$file_to_compress"


#Removes wtmp.gz file
rm /var/log/wtmp.gz