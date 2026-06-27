#!/bin/bash

#installing mysql and Ngnx using Functions

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Please run this script as a root user"
    exit 1
fi

VALIDATE() 
{
    if [ $2 -ne 0 ]; then
     echo "$1 INSTALLATION FAILED"
     exit 1
    else
     echo "$1 INSTALLATION IS SUCCESSFUL"
    fi
}


dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "MySQL is already Installed on the system"
else
        echo "Installing MYSQL"
        dnf install mysql -y
        VALIDATE mysql $?
fi

#Installing NGINX

dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "NGINX is already installed in the system"
   else
    echo "Installing Nginx"
    dnf install nginx -y
    VALIDATE nginx $?
fi
