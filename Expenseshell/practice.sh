#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/roboshop-logs"
LOG_FILE_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$LOG_FILE_NMAE.log"
Timestamp=$(date +%y-%m-%d-%H-%M-%S)

mkdir -p $LOG_FOLDER
#writing the function to validate user
ROOT_CHECK () {
    if [ $USERID -ne 0 ]
    then 
        echo -e " $R ERROR $N...you must have root access to run this script" | tee -a $LOG_FILE
        exit 1
    fi    
}

VALIDATE () {
    if [ $1 -ne 0 ]
    then 
        echo -e " $2..... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e  "$2 ..... $G SUCCESS $N" | tee -a $LOG_FILE    
    fi    
} 

echo "script is started running at: $Timestamp" | tee -a $LOG_FILE
ROOT_CHECK


cp mongo.repo /etc/yum.repos.d/mongo.repo 
VALIDATE $? "Copying repo file" 


dnf install mongodb-org -y  &>> $LOG_FILE
VALIDATE $? "Installing mongodb server" 

systemctl enable mongod &>> $LOG_FILE
VALIDATE $? "Enabling mongod service"


systemctl start mongod &>> $LOG_FILE
VALIDATE $? "Starting mongod service"

# sed is stream editor and is used to make chages in files while running the script.
#for making temporary changes we use "-e" and to make permanent chages we use "-e" with sed command 
sed -i 's/0.0.0.0/127.0.0.1/g' /etc/mongod.conf &>> $LOG_FILE
VALIDATE $? "Starting mongod service"

systemctl restart mongod &>> $LOG_FILE
VALIDATE $? "re-starting mongod service"








