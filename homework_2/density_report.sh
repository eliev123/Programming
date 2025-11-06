#!/bin/bash

# Store the input file name
file="/home/shared/FA25_coding/Exam_1/SLF_genomic.gff"

# Create output text file
echo -e "Chromosome\tGeneCount\tClass" > density_report.txt

# Create an array of unique chromosome names from column 1
chromosomes=($(grep -v "^#" "$file" | cut -f1 | sort | uniq))

# Loop through each chromosome
for chr in "${chromosomes[@]}"
do
    # Use awk to count only lines where column 1 = chromosome and column 2 = gene
    count=$(awk -v chr="$chr" '$1 == chr && $3 == "gene" {count++} END {print count+0}' "$file")

    # Classifies chromosome as high density if it is over 2000 and low density if it is under 2000
    if [ "$count" -gt 2000 ]; then
        class="High-density"
    else
        class="Low-density"
    fi

    # Remove .gff extension from chromosome name
    chr_name=$(basename "$chr" .gff)

    # Write to the text file
    echo -e "${chr_name}\t${count}\t${class}" >> density_report.txt
done

echo "density_report.txt created successfully."

