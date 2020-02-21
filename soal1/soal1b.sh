#!/bin/bash

echo "Dua state dengan profit paling kecil berdasarkan poin a adalah:"
awk -F '\t' '/Central/ NR >1 {a[$11]+=$21} END {for(i in a) print i",",a[i]}' Sample-Superstore.tsv | sort -t $"," -g -k2 | awk -F, '{print $1}'| head -2
