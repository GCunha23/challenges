#!/usr/bin/python
#Script:    Ops Challenge 06
#Author:    Gonçalo Cunha
#Date of latest revision:   18/10/2023
#Purpose:   Run BASH commands

import os

#Variables
user = os.system("whoami")
ip = os.system("ip a")
hardware_paths = os.system("lshw -short")

#Printing variables
print(user)
print(ip)
print(hardware_paths)