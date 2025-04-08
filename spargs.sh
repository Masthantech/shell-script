#!/bin/bash

# I am printing the special variables

echo "All the variables passed: $@"
echo "Number of variables: $# "
echo "Script name: $0 "
echo "Present working directory: $PWD "
echo "Home directory of user: $HOME "
echo "Which user is running the script: $USER "
echo "Process id of the current script: $$ "
sleep 2
echo "process id of last command in background: $! "

echo "all the variables passed: $@"
echo "number of variables passed: $#"
echo "Cunnenr working directory: $PWD"
echo "home directory of the user:$HOME"
echo "name of the running script: $0"
echo "process if of the present script: $$"
echo "process id of th background script that is running: $!"
echo "user running the script: $USER"
