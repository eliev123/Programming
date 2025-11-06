#!/bin/bash

#stores the GFF file name into a variable
file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

#counts the total number of features
total=$(grep -v "^#" "$file" | wc -l)

#Count how many features are of type gene, mRNA, and exon by only checking the third column
genes=$(grep -v "^#" "$file" | awk '$3 == "gene"' | wc -l) 
mrnas=$(grep -v "^#" "$file" | awk '$3 == "mRNA"' | wc -l)
exons=$(grep -v "^#" "$file" | awk '$3 == "exon"' | wc -l)

#Print the report to the terminal
echo "Total number of features: $total"
echo -e "gene:\t$genes" 
echo -e "mRNA:\t$mrnas"
echo -e "exon:\t$exons"

echo "Script Completed"
