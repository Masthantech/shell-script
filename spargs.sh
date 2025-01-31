#!/bin/bash

#I am writing special args

echo "Script name is: $0"
echo "First argument is: $1"
echo "Second argument is: $2"
echo "Total nuber of arguments are: $#"
echo "All arguments as list: $@"
echo "All argumets as a string: $*"
echo "present working directory: $PWD"
echo "Home directory of the current user: $HOME"
echo "user that is running the current script:$USER"
echo "process id of current script: $$"
echo "process id of last command in background: $!"

