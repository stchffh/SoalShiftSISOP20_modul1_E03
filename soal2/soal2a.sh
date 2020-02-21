#!/bin/bash

filename=$1
        if [ $# -eq 2 ]; 
        then length=$2
        else length=29
        fi
digits=({0..9})
lower=({a..z})
upper=({A..Z})
CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
ArrayLength=${#CharArray[*]}

if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
for i in `seq 2 $length`
do
        index=$(($RANDOM%$ArrayLength))
        char=${CharArray[$index]}
        password=${password}${char}
done 
echo $password >> /home/opi/$1.txt
else 
echo "error"
fi
