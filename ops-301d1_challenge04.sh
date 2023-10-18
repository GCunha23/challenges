#!/bin/bash
while true; do
echo "Choose an option (1/2/3/4)"
echo "1) Print "Hello world!""
echo "2) Ping self"
echo "3) IP info"
echo "4) Exit"
read option
if [[ $option == "1" ]]; then
echo "*Waving hand*"
echo "Hello world!"
elif [[ $option == "2" ]]; then
echo "Pinging self..."
ping localhost
elif [[ $option == "3" ]]; then
echo "Here's your IP info!"
ifconfig
elif [[ $option == "4" ]]; then
echo "See you later, alligator!"
exit 0
else
echo "Invalid choice! Can you even count up to 4?"
fi
done
