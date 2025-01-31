#!/bin/bash
#check the input and confirm today is holiday or not.

echo "Please enter the day of today: "
read day

if [ $day="Sunday" ]
then
    echo "Today is holiday! Enjoy the day"
else
    echo "You need to go school today..." 
fi

