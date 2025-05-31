#!/bin/bash


USERID=$(id -u)

if [ ${USERID} -nq 0 ] ; then
    echo "You need root permissions to exeucte this script"
    exit 1
elif     
    





