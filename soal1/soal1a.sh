#!/bin/bash

echo "Region dengan profit paling sedikit adalah:"
awk -F '\t' 'NR > 1 {a[$13]+=$21} END {for(i in a) print i",",a[i]}' Sample-Superstore.tsv | sort -t $"," -n -$2 | awk -F, '{print $1}' | head -n 1
