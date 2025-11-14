#!/bin/bash

#Store the input file name in a variable
file="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#Create an array of unique site codes from column 2 (skip header)
sites=($(tail -n +2 "$file" | cut -d',' -f2 | sort | uniq))

#Create output file and add header line
echo -e "Site_Code\tClass" > Urbanization_classification.txt

#creats a Loop through each site
for site in "${sites[@]}"
do
    #Extract column 5 for this site
    ip_values=$(grep ",${site}," "$file" | cut -d',' -f5)

    #Calculate average %IP-5KM using awk only
    avg_ip=$(echo "$ip_values" | awk -F',' '{sum+=$1} END {if (NR>0) print sum/NR; else print 0}')

    #Use awk compatible numeric comparison for classification
    if awk "BEGIN {exit !($avg_ip < 15)}"; then
        class="Rural"
    elif awk "BEGIN {exit !($avg_ip < 50)}"; then
        class="Suburban"
    else
        class="Urban"
    fi

    #Writes down the  site and classification to the file
    echo -e "${site}\t${class}" >> Urbanization_classification.txt
done

#Print completion message
echo "Urbanization_classification.txt created"

