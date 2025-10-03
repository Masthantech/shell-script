#!/bin/bash
<<comment
#we are writing the script to install git and mysql in system, to minimize the lines
 of codes we are writing the functions. the repetable code will be kept inside the 
 functions and can called as many times as we want
comment

validate () {
    if [ $1 -ne 0 ]
    then
        echo "$2...Failure"
        exit 1
    else
        echo "$2...Success"   
    fi
}

USERID=$(id -u)

#cheking the user that is running the script is root user or not

if [ $USERID -ne 0 ]
then
    echo "You need root access to run the script.."
    exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    validate () $? "Git Installation"
else 
    echo "Git is already installed"  
fi

dnf list installed mysql


