#!/bin/bash

TIMESTAMP=$(date)  #Timestamp

echo "Today's Date is $TIMESTAMP"

File_list=$(ls -l)    #Files list using (ls -l)

echo "Files present in this folder are : $File_list"

#Total time (END-START)

START_TIME=$(date +%s)
sleep 10
END_TIME=$(date +%s)
TOTAL_TIME=$((END_TIME - START_TIME))
echo "TOTAL Time is: $TOTAL_TIME"

echo "Trainer's code"
TOTAL_TIME=$(($END_TIME - $START_TIME))
