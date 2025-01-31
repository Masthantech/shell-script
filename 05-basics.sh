#!/bin/bash
#variable_name=value
#there is no strict data types in shell script, it takes data type by default like string , integer etc
name="aman"
echo "Hi, ${name}!"
age=25
echo "age: $age years"
x=10 y=20
sum=$((x+y))
echo "the sum of x and y is: $sum"

# we can capture the output of a command and assign it to  a new variable as a value.
today_date='date'
echo "Today's date is: $today_date"

