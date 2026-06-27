#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "please run the script as a root user"
    exit 1
fi

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "MySQL is already installed on the system"
else
    echo "Installing MYSQL"
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "MYSQL installation is failed"
        exit 1
    else
        echo "MYSQL Installation is successful"
    fi
fi