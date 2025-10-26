#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_folder="/var/log/shell-script-logs"
File_name=$(echo $0 | cut -d "." -f1)
Log_file="$Log_folder/$File_name.log"
Source_dir=/home/ec2-user/app-logs
mkdir -p $Log_folder
echo -e "Script started executing at : $(date)"

CHECK_ROOT () {
    if [ $USERID -ne 0 ]
    then 
        echo -e "$R ERROR $N....Please run the scriupt with root access" | tee -a $Log_file
        exit 1
    else
        echo -e " $Y You are running the script with root access $N"    | tee -a $Log_file
    fi    
}

VALIDATE () {
    if [ $1 -ne 0 ]
    then    
        echo -e " $2.... $R FAILURE $N" | tee -a $Log_file
        exit 1
    else    
        echo -e "$2.... $Y SUCCESS$N "  | tee -a $Log_file
    fi      
}

CHECK_ROOT

Files_to_delete=$(find $Source_dir -name "*.log" -mtime +14)

#IFS is Internal field seperator
while IFS= read -r filepath
do  
    rm -rf $filepath

done <<< $Files_to_delete 

