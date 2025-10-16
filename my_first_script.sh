#! /bin/bash

#add header line
echo "These are my friends:" >myfriends.txt
#set a counter eqial to 1
COUNTER=1

# run for loop on list of friends
for FRIEND in Elie Hasita Juhi Jon Lu Caroline
do
	counter=1
	echo $FRIEND >> myfriends.txt #echo value of friend 
	echo "on friend number $COUNTER" >> myfriends.txt
	((COUNTER++)) #increases my counter by 1
done

#decrease counter by 1 to get accurate count
((COUNTER--))

#echo total number of friends to file
echo "Total Number of Friends: $COUNTER" >> myfriends.txt

#echo completion to standard out
echo "Script completed :)"
