#!/bin/bash

for((i=1;i<29;i++))
do
wget -O pdkt_kusuma_$i https://loremflickr.com/320/240/cat --append-output wget.log >> wget.log
done
