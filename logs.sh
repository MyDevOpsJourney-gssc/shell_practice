#!/bin/bash

#installing mysql and Ngnx using Functions

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"


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


dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "MySQL is already Installed on the system"
else
        echo "Installing MYSQL"
        dnf install mysql -y &>> $LOGS_FILE
        VALIDATE mysql $?
fi

#Installing NGINX

dnf list installed nginx &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "NGINX is already installed in the system"
   else
    echo "Installing Nginx"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi
