#!/bin/bash

USERID="$(id -u)"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\e[35m"
Folder_name="/var/log/shell-script-logs"
File_name="$(echo $0 | cut -d "." -f1)"
Timestamp="$(date +%d-%m-%d-%H-%M-%S)"
Log_file_name="$Folder_name/$File_name-$Timestamp.log"

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
    echo -e "$P You need root access to run the script.. $N"
    exit 1
fi

echo "Script is started executing at : $Timestamp" >> Log_file_name

dnf list installed git >>Log_file_name
if [ $? -ne 0 ]
then
    dnf install git -y >> Log_file _name
    validate $? "Git Installation"
else 
    echo -e  " $Y Git is already installed $N"  
fi