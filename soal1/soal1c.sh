#!/bin/bash

echo "Sepuluh produk yang memiliki profit paling sedikit berdasarkan poin b adalah:"
state1="Illinois"
state2="Texas"
awk -F '\t' -v state1="$state1" -v state2="$state2" '($11~state1) || ($11~state2) {a[$17]+=$21} END {for(i in a) print i";",a[i]}' Sample-Superstore.tsv | sort -t $";" -g -k2 | head -10
