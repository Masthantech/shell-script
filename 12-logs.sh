#!/bin/bash

USERID=`id -u`
#writing variables for color codes \e[31m]
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
FOLDER_NAME="/var/log/shellscript-logs"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$FOLDER_NAME/$FILE_NAME-$TIMESTAMP.log"

validate() {
    if [ $1 -ne 0 ]; then 
       echo -e "$2  $R FAILURE $N"
       exit 1
    else 
        echo -e "$2  $G SUCCESS $N"
    fi       
}

echo "script started executing at:: $TIMESTAMP" &>> $LOG_FILE_NAME

if [ ${USERID} -ne 0 ]; then 
   echo "You need sudo access to execute this script"
   exit 1
fi 

dnf list installed git &>> $LOG_FILE_NAME

if [ $? -ne 0 ]; then 
    dnf install git -y
    validate $? "GIT INSTALLATION..." 
else 
    echo -e "Git Already...  $Y INSTALLED $N"
fi        
