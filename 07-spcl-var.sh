#!/bin/bash

#Special Varibales recognized by LINUX

#Files_list=$(ls -l)
#echo "All arguments passed in the script are: $@"
User_name=$(whoami)
echo "Files in the present directory is: $(ls -l)"
echo "User name is $User_name"
echo "Total number of arguments passed: $#"
echo "The script name is : $0"
echo "The first Argument and second argument passed are :$1 and $2"
echo "The current working directory is $PWD"
echo "The process ID of the current process is $$"
sleep 5&
echo "The process ID of the background running process is $!"
echo "The line number is $LINENO"
echo "The random number generated is $RANDOM"
#echo "The exit status of the last command is $?"

