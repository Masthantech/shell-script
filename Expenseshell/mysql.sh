#!/bin/bash


dnf install mysql-server -y &>> Log_file_name
validate S? "Installing mysql"

systemctl enable mysqld &>> Log_file_name
validate $? "enabling mysql" 

systemctl start mysqld &>> Log_file_name
validate $? "Starting mysql" 

mysql -h mysql.shaik.cloud -u root -pExpenseApp@1 -e "show databases;" &>> Log_file_name

if [ $? -ne 0 ]
then 
    echo -e "root passwoed is not set up for mysql..setting up now"
    mysql_secure_installation --set-root-pass ExpenseApp@1 
    validate $? "setting up root password"
else 
    echo -e "Root password is already setted up.. $Y skipping $N"    
fi    