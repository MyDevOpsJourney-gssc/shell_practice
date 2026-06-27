#!/bin/bash

#sum of number and linux

Val1=$1
Val2=$2
sum=$(($Val1+$Val2))
echo "the sum of values $Val1 and $Val2 is $sum"


MOVIES=("Inception" "Interstellar" "The Dark Knight" "Tenet")
echo "Movies in the array are ${MOVIES[@]}"
echo "The first movie name is ${MOVIES[0]}"
echo "The second movie name is ${MOVIES[1]}"

