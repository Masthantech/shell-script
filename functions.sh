#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ] ; then
echo "You need sudo access to run the script"

validate () {
   if [ $1 -ne 0 ] ; then
        echo "Git installation.....Failure"
        exit 1
    else 
        echo "Git installtion......Success"
    fi  
}

dnf list installed git 
if [ $? -ne 0 ] ; then 
    dnf install git -y 
    validate $?
else 
    echo "Git already installed on machine"  

fi 


