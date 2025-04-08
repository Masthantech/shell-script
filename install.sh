#!/bin/bash

# writing the script to install the mysql

USERID=$(id -u)

if [$USERID -ne 0]
then 
    echo "you need root permissions to run this script"
    exit 1
fi 

dnf install mysqll  -y

dnf install git -y 