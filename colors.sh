#!/bin/bash

USERID=`id -u`
R="\e[31m"
G="\e[32m"
Y="\e[33m"

validate () {
    if [ $1 -ne 0 ] ; then 
        echo -e "$2  $R Filure"
        exit 1
    else 
        echo -e "$2  $G Success"   
    fi     
}

if [ ${USERID} -ne 0 ]; then
    echo "You need sudo access to execute this script"
    exit 1
fi


dnf list installed git
if [ $? -ne 0 ]:; then
    dnt install git -y
    validate $? "Git installation"
else 
    echo -e "$Y Git already installed in your machine"    