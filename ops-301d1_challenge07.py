#!/usr/bin/python3
#Script:        Ops Challenge 07
#Author:        Gonçalo Cunha
#Date of latest revision:       17/10/2023
#Purpose:       Directory Creation

# Import libraries

import os

# Declaration of variables

### Read user input here into a variable

# Declaration of functions

### Declare a function here

for (root,dirs,files) in os.walk("testdir"):
    ### Add a print command here to print ==root==
    print(root)
    ### Add a print command here to print ==dirs==
    print(dirs)
    ### Add a print command here to print ==files==
    print(files)