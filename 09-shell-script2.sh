#!/bin/bash

validate () {
    if [ $1 -ne 0 ]
    then
        echo -e " $R $2...ERROR $N"
        exit 1
    else 
        echo -e " $G $2...SUCCESS $N"
    fi
}
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\e[35m"
N="\e[0m]"

Log_folder_name="/var/log/shell-script-logs"
Log_file_name="$(echo $0 | cut -d "." -f1)"
Timestamp=$(date +%y-%m-%d-%H-%M-%S)
Log_file_name="$Log_folder_name/$Log_file_name-$Timestamp.log"

#we need to check the user running the script is root user or not

echo "Script started executing at: $Timestamp" >> $Log_file_name

if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR...You need root access to run the script $N"
    exit 1
fi 

for package in $@
do
    dnf list installed $package >>$Log_file_name
    if [ $? -ne 0 ]
    then 
        dnf install $package -y >> $Log_file_name
        validate $? "$package installation"
    else
        echo -e "$Y $package is already installed in your system $N"   
    fi                 
done    