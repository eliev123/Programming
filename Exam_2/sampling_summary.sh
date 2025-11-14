#!/bin/bash

#Store the input file name in a variable
file="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#Creates an array of unique site codes from column 2, skipping the header line
sites=($(tail -n +2 "$file" | cut -d',' -f2 | sort | uniq))

#Creates output file and add header line
echo -e "Site_Code\tN_Samples\tN_Males\tN_Females" > sampling_summary.txt

#Counts the number of unique sites and print to output file
num_sites=${#sites[@]}
echo -e "Number of sites:\t${num_sites}" >> sampling_summary.txt
echo "" >> sampling_summary.txt #adds a blank line for readability

#Loop through each site code
for site in "${sites[@]}"
do
    #Counts total number of samples for this site
    total=$(grep ",${site}," "$file" | wc -l)

    #Counts number of males (M) for this site
    males=$(grep ",${site}," "$file" | grep ",M," | wc -l)

    #Counts number of females (F) for this site
    females=$(grep ",${site}," "$file" | grep ",F," | wc -l)

    #Write site code, total samples, males, and females to the output file
    echo -e "${site}\t${total}\t${males}\t\t${females}" >> sampling_summary.txt
done

#Print a completion message to show that the script is done
echo "sampling_summary.txt created"

