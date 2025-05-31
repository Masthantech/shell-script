#!/bin/bash

#This is the script to install git

USERID=`id -u`

if [ USERID -ne 0 ]; then
   echo "You need sudo access to execute this script"
   exit 1
fi

dnf list installed git
if [ $? -ne 0 ]; then
    dnf install git -y
    if [ $? -ne 0 ]: then 
       echo "ERROR : Git installation is failure"
       exit 1
    else 
        echo "Success: git installed"
    fi
else
    echo "Git is already installed on your machine"

fi











    
    
