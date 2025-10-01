#!/bin/bash 

#shell has some special variables, let's discuss about them
# $1 and $2 and $3 are varibales that we pass

echo "All variables passed: $@"
echo "No of variables passed is: $#"
echo "Current running script name: $0"
echo "Present working directory: $pwd"
echo "Home directory of current user: $HOME"
echo "User that is running the script: $USER"
echo "Process ID of the script: $$"
echo "Process id of thr last command in the background: $!"

