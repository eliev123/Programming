#!/bin/bash

# Stores the GFF file name in a variable
file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

# prints the header for the table
echo -e "Chromosome\tGeneCount"

#creates an array of the unique chromosome names
chromosomes=($(grep -v "^#" "$file" | cut -f1 | sort | uniq))

# for each chromosome, counts how many "gene" features there are
for chr in "${chromosomes[@]}"
do
    count=$(awk -v chr="$chr" '$1 == chr && $3 == "gene" {count++} END {print count+0}' "$file") #counts number of lines in column 1 that = chromosome and column 3 that = gene
    echo -e "${chr}\t${count}" #prints the chromosome's name and the gene count
done

echo "Script Completed."
