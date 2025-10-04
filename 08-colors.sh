#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
validate () {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R...Failure $N"
        exit 1
    else
        echo  -e "$2  $G...Success $N"   
    fi
}


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
    validate $? "Git Installation"
else 
    echo -e  " $Y Git is already installed $N"  
fi