#!/bin/bash

#Store the input file name in a variable
file="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#Name of the output file
output="Measurer_summary_report.txt"

#Create output file and add header line
echo -e "Measurer\t#Samples\t#Rural\t#Suburban\t#Urban" > "$output"

#Create an array of unique measurer initials
measurers=($(cut -d',' -f1 "$file" | sort | uniq))

#Loop through each measurer
for m in "${measurers[@]}"
do
    #Count the total number of samples measured by this measurer
    total=$(grep "^${m}," "$file" | wc -l)

    #Count number of rural samples (<15)
    rural=$(grep "^${m}," "$file" | awk -F',' '$5 < 15' | wc -l)

    #Count number of suburban samples (15–49)
    suburban=$(grep "^${m}," "$file" | awk -F',' '$5 >= 15 && $5 < 50' | wc -l)

    #Count number of urban samples (>=50)
    urban=$(grep "^${m}," "$file" | awk -F',' '$5 >= 50' | wc -l)

    #Write formatted line to the output file
    echo -e "${m}\t${total}\t${rural}\t${suburban}\t${urban}" >> "$output"
done

#Print completion message
echo "Measurer_summary_report.txt created"

