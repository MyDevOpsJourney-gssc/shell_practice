#!/bin/bash

USERNAME=$1
GROUP=$2
TEXTFILE=$3

USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
	echo "run with ROOT USER"
    exit 1
fi

 CREATION()
  {
    if [ $2 -ne 0 ]; then
		echo "$1 creation FAILED"
		exit 1
   else
		echo "$1 Creation is Successful"
		
	fi
  
  }
  
  EXISTING() 
  {
    if [ $2 -ne 0 ]; then 
		echo "The given $1 is not exist"
		
    else
		echo "The given $1 exists"
	fi
  }
  
  ADD_GRP()
  {
    if [ $3 -ne 0 ]; then
	   echo "$1 is not added to Group $2"
       exit 1
	else 
	   echo "$1 is added to Group $2"
    fi   
  }

START_TIME=$(date +%s)
echo "Start time of the $0 Script is $START_TIME"
 echo "Checking the existence of the User $USERNAME"
 getent passwd $USERNAME
 EXISTING $USERNAME $? 

 echo "Creating User $USERNAME" 
 useradd $USERNAME
 CREATION $USERNAME $?
 
 
 echo "Creating Password for  user $USERNAME. Please enter the password"
 read -s password
 echo "The password for this user $USERNAME is $password"
 echo "UID of the User $USERNAME is $(id $USERNAME)"
 echo "Checking the existence of the Group $GROUP"
 getent group $GROUP
 EXISTING $GROUP $? 
 echo "Creating Group $GROUP"
 groupadd $GROUP
 CREATION $GROUP $?


#Adding User to Group
echo "Adding User $USERNAME to Group $GROUP"
usermod -G $GROUP $USERNAME
ADD_GRP $USERNAME $GROUP $?

#TEXTFILE CRAETION 
echo "Creating Textfile $TEXTFILE"
touch $TEXTFILE
CREATION $TEXTFILE $?

#Adding Permission for the Textfile
echo "Adding Permission for the Textfile $TEXTFILE"
chmod 740 $TEXTFILE
Permissions=$(ls -l $TEXTFILE)
echo "File Permissions of the $TEXTFILE is $Permissions"

END_TIME=$(date +%s)
echo "END time for the $0 Script is $END_TIME"

EXECUTION_TIME=$(($END_TIME-$START_TIME)) 
echo "TotalExecution Time for $0 Script is $EXECUTION_TIME"