#!/bin/bash
echo "$(date +'%d-%m-%Y %H:%M:%S') - Starting the script..."
echo "$(date +'%d-%m-%Y %H:%M:%S') - Copying directory /var/log/journal to current working directory."
cp -r /var/log/journal ./journal_$(date "+%Y.%m.%d-%H.%M.%S")
echo "$(date +'%d-%m-%Y %H:%M:%S') - Copy completed."
echo "$(date +'%d-%m-%Y %H:%M:%S') - Journal directory copied to current working directory."