#!/bin/bash

echo "Hi, i resume my devops journey. I am starting shell scripting . This time I won't step back or stop my learning journey 
in between. I will complete it properly"

echo "Hello world"
#addition of two numbers
a=1
b=2
sum=$((a+b))
echo "the sum of $a and $b is: ${sum}"

#arguments

# a=$1
# b=$2 

# multiplication=$((a-b))
# echo "the difference b/w $a and $b is: $multiplication" 

#reading input from user
<<COMMENT1
echo "please enter your user name: "

read -s name
echo "username entered is: $name "
echo "enetr your password:"
read -s password 

echo "your account login is successful"


Timestamp=$(date)

echo "today's date is: ${Timestamp}"



#special variables

echo "All variables passed: $@"
echo "number of variables passed: $#"
echo "Name of the script:$0"
echo "Present working directory:$PWD"
echo "home directory oy user:$HOME"
echo "user that is running the : $USER "
echo "result of previous command:$?"
sleep 5
echo "process id of last command in background: $!"

C

price=150
if [ ${price} -gt 100 ]; then
    echo "kg apples rate is more than 100"
else 
    echo "kg apples rate is less than 100, we can buy"
fi



num=-10 

if [ $num -gt 10 ] ; then
   echo "num is grater than 10"
elif [ $num -eq 10 ] ; then 
   echo "num is equal to 10"
else 
    echo "num is less than 10"
fi
COMMENT1

movies=("forrest gump", "lost in iland", "terminal")

echo "${movies[0]}"
echo "${movies[1]}"
echo "${movies[2]}"


