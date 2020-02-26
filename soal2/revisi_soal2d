#!/bin/bash

filename=$1
file="${filename%.*}"
key=$(stat -c %w $filename | date '+%H' -r $filename)

low=abcdefghijklmnopqrstuvwxyz
low=$low$low
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZ
upper=$upper$upper

updatefile=`printf "$file"  | tr [${low:$key:26}${upper:$key:26}] [${low:26}${upper:26}]`

mv $file.txt $updatefile.txt
