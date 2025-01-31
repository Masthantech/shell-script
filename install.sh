#!/bin/bash
#write the script to automate the installtion of mysql

userid=$( id -u )

if [ $userid -ne 0 ]
then
    echo "ERROR:: You must need sudo access to execute this script"
    exit  #other than 0
fi

