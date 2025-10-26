#!/bin/bash

echo "script started running at:$Timestamp" &>> $Log_file_name

check_root 

dnf module disable nodejs -y &>> $Log_file_name
validate $? "Disabling nodejs"

dnf module enable nodejs:20 -y &>> $Log_file_name
validate $? "Enabling nodejs"

dnf install nodejs -y  &>>$Log_file_name
validate $? "Installing Nodejs"

id expense 

if [ $? -ne 0 ]
then 
    echo "System user for the service not there..crating now"
    useradd --system --home /app --shell /sbin/nologin --comment "expense system user" expense &>> $Log_file_name
    validate $? "Creating expense user"
else 
    echo  -e "Expense system user is already created.. $Y Skipping  $N"    
fi 


mkdir -p /app  &>> $Log_file_name
validate $? "Creating App folder"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>> $Log_file_name
validate $? "downloading backend code"

cd /app 
rm -rf /app/*

unzip /tmp/backend.zip &>> $Log_file_name
validate $? "unzipping code in app folder"

npm install &>> $Log_file_name
validate $? "Installing dependencies"

cp /home/ec2-user/Expenseshell/backend.service  /etc/systemd/system/backend.service


dnf install mysql -y &>>$Log_file_name
validate $? "Installing MySQL Client"


mysql -h mysql.shaik.cloud -u root -pExpenseApp@1  < /app/schema/backend.sql &>> $Log_file_name
validate $? "Loading the schema into database"

systemctl daemon-reload &>> $Log_file_name
validate $? "reloading backend.service" 

systemctl enable backend &>> $Log_file_name
validate $? "Enabling backend"

systemctl restart backend &>> $Log_file_name
validate $? "Starting Backend"



















