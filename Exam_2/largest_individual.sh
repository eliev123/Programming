#!/bin/bash

#Store the input file name in a variable
file="/home/shared/FA25_coding/Exam_2/Exam2_Levine_et_al_body_size.csv"

#Output file name
output="largest_individual_report.txt"

#Creates output file and adds header line
echo -e "Category\tLength(mm)\tSite_Code" > "$output"

#Finds the longest male:
#   - grep ",M," extracts males (sex column = M)
#   - cut -d',' -f4 extracts the length field
#   - sort -nr sorts numerically, largest first
longest_male_length=$(grep ",M," "$file" | cut -d',' -f4 | sort -nr | head -n 1)

#Find which site this male came from:
#   - grep the exact length to get that row
#   - cut -d',' -f2 extracts the site code
longest_male_site=$(grep ",M," "$file" | grep "$longest_male_length" | cut -d',' -f2 | head -n 1)

#Write down  male results to output
echo -e "Longest_Male\t${longest_male_length}\t${longest_male_site}" >> "$output"


#Finds the longest female:
#   - grep ",F," extracts females
#   - cut -d',' -f4 extracts the length field
#   - sort -nr sorts numerically
longest_female_length=$(grep ",F," "$file" | cut -d',' -f4 | sort -nr | head -n 1)

#Find which site this female came from:
longest_female_site=$(grep ",F," "$file" | grep "$longest_female_length" | cut -d',' -f2 | head -n 1)

#Write female results to output
echo -e "Longest_Female\t${longest_female_length}\t${longest_female_site}" >> "$output"


#See if longest male and female were collected from same site:
#   - If/then to compare the two site codes
if [ "$longest_male_site" == "$longest_female_site" ]; then
    same_site="YES"
else
    same_site="NO"
fi

#Write the same-site comparison to output file
echo -e "Same_Site?\t${same_site}" >> "$output"

#Print completion message
echo "largest_individual_report.txt created"

