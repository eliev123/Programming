#!/bin/bash

# stores GFF file name
file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

#Creates a file listing all chromosome IDs
grep -v "^#" "$file" | cut -f1 | sort | uniq > chromosome_list.txt

#Use a while loop to read each chromosome ID and extract all unique chromosome names
while read chr
do
    #For each chromosome extracts all lines matching that chromosome and save to new file
    grep -w "$chr" "$file" > "${chr}.gff"

    #Prints status message when done
    echo "Wrote ${chr}.gff"
done < chromosome_list.txt
