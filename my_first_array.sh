#! /bin/bash

#set counter to 0
COUNTER=0
#while the value of counter is less than 150
while [ $COUNTER -lt 150 }

do
	my_array[$COUNTER]=$COUNTER #populate the element with the value of the counter

	echo $(my_array[$COUNTER]} >> my_array_list.txt  #echo the value of the counter in the array cell to a file

	let COUNTER=COUNTER+1 #increase the value of the counter

done
