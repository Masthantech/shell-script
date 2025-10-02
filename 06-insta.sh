#!/bin/bash

#I am writing the script for installating git in the system.
<<comment 
steps to install git using shell
first user should be root user
need to check is git is alredy installed if not then need to install
if any error occurs then from there script should not not.
add the information abot the installation like success or failure or error etc
comment

USERID=$(id -u)
#checking who is running the script
if [ $? -ne 0 ]
then
    echo "you must need root access to the script"
    exit 1
fi 

dnf list installed git 

if [ $? -ne 0 ]
then 
    dnf install git -y 
    if [ $? -ne 0 ]
    then
        echo "Installation of Git..ERROR"
        exit 1
    else 
        echo "Installation of Git..Success"
    fi        
else
    echo "Git is already installed"
fi    
