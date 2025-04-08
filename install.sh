#!/bin/bash

# writing the script to install the mysql

USERID=$(id -u)

if [$USERID -ne 0]
then 
     echo "you need root permissions to run this script"
else 
    dnf install mysql -y

fi