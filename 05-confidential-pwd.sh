#!/bin/bash

# Script for username and confidential  password using read and read -s

person=User
echo "Hello $person, Please enter your username here: "
read USER_NAME 
echo "The User_Name entered is $USER_NAME"

echo "Hello $person, Please enter your password here: "
read -s PASSWORD
echo "The Password for this User $USER_NAME is $PASSWORD"

