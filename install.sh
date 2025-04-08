#!/bin/bash

# writing the script to install the mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
     echo "you need root permissions to run this script"
     exit 1      
fi 

dnf list installed git 

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ] 
    then
        echo "git installation is failure"
        exit 1
    else 
        echo "git installtion in sucess"
    fi

else 
    echo "git is already installed"  
fi              
    
    
