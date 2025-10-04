#!/bin/bash

USERID="$(id -u)"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\e[35m"
Folder_name="/var/log/shell-script-logs"
File_name="$(echo $0 | cut -d "." -f1)"
Timestamp="$(date +%y-%m-%d-%H-%M-%S)"
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

echo "Script is started executing at : $Timestamp" >> $Log_file_name
<< comment
dnf list installed git >>$Log_file_name
if [ $? -ne 0 ]
then
    dnf install git -y >> $Log_file_name
    validate $? "Git Installation"
else 
    echo -e  " $Y Git is already installed $N"  
fi
comment

for package in $@
do
  dnf list installed package >> $Log_file_name
  if [ $? -ne 0 ]
  then
      dnf install package -y >> $Log_file_name
      validate $? "$package installation"
  else 
      echo -e " $Y $package is alredy installed $N"
  fi
done 


