#!/usr/bin/python3
#Script:        401d1 - Ops Challenge 01
#Author:        Gonçalo Cunha
#Date of latest revision:       09/11/2023
#Purpose:       Uptime Sensor Tool

# Imports necessary modules for handling pings, timestamps, and introducing delays
from multiping import MultiPing
from datetime import datetime
import time

# Writes a log entry to a file with timestamp, status, and destination IP
def write_to_log(timestamp, status, destination_ip):
    with open("uptime_log.txt", "a") as log_file:
        log_file.write(f"{timestamp} {status} to {destination_ip}\n")

# Checks if the script is being run directly
if __name__ == "__main__":
    
    # Prompts the user to input the target IP address
    target_ip = input("Enter the target IP address: ")

    # Creates a list containing the target IP address
    addrs = [target_ip]
    
    # Prints a message indicating the script is monitoring uptime
    print("Monitoring uptime. Press Ctrl+C to stop.")

    # Starts an infinite loop for continuous monitoring
    try:
        while True:

            # Sends a ping to the specified IP address
            mp = MultiPing(addrs)
            mp.send()

            # Waits for 2 seconds to receive responses
            responses, no_response = mp.receive(2)

            # Gets the current timestamp
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

            # Based on whether there are no responses, it determines the status
            if not no_response:
                status = "Network Active"
            else:
                status = "Network Inactive"

            # Prints the status, timestamp, and target IP
            print(f"{timestamp} {status} to {target_ip}")

            # Logs the event using the write_to_log function
            write_to_log(timestamp, status, target_ip)

            # Introduces a 2-second delay between pings
            time.sleep(2)

    # If a KeyboardInterrupt (Ctrl+C) is detected, it prints a message that monitoring has stopped
    except KeyboardInterrupt:
        print("\nMonitoring stopped.")
