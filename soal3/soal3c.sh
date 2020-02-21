grep "Location" wget.log > location.log 
mkdir -p kenangan duplicate 

awk '{print i+1"-"$2; i+=1}' location.log | awk -F '-' '{ a[$2]++
	if (a[$2] > 1) {command = "mv pdkt_kusuma_" $1 " duplicate/duplicate_" $1} 		
  else {command = "mv pdkt_kusuma_" $1 " kenangan/kenangan_" $1}
	system(command)}'

cp wget.log wget.log.bak
