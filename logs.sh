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

VALIDATE_UNINSTALL()
{
if [ $2 -eq 0 ]; then
  echo "$1 is uninstalled successfully"
  
else
  echo "$1 uninstallation is failed"
  exit 1
fi
}


dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "MySQL is already Installed on the system, So I am removing that"
    dnf remove mysql -y 
    VALIDATE_UNINSTALL mysql $?

else
        echo "Installing MYSQL"
        dnf install mysql -y &>> $LOGS_FILE
        VALIDATE mysql $?
fi

#Installing NGINX

dnf list installed nginx &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "NGINX is already installed in the system, So I am removing that"
    dnf remove nginx -y
    VALIDATE_UNINSTALL nginx $?
       else
    echo "Installing Nginx"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi
