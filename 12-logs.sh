#!/bin/bash

USERID=`id -u`
#writing variables for color codes \e[31m]
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


validate() {
    if [ $1 -ne 0 ]; then 
       echo -e "$2  $R...Failure $N"
       exit 1
    else 
        echo -e "$2  $G....Success $N"
    fi       
}

if [ ${USERID} -ne 0 ]; then 
   echo "You need sudo access to execute this script"
   exit 1
fi 

dnf list installed git 

if [ $! -ne 0 ]; then 
    validate $! "Git installtion" 
else 
    echo -e "Git already  $Y...Installed $N"
fi        
