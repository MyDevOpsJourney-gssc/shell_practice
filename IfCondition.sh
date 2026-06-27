#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -gt 10 ]; then
    echo "The number is greater than 10"
else
    echo "The number is less than or equals to 10"
fi