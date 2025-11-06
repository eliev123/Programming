#!/bin/bash

# creates a file named chromosome_summary.txt with 
echo -e "Chromosome\tgene\tmRNA\texon" > chromosome_summary.txt

#Loop through each .gff file
for file in *.gff
do
    # make sure the file actually exists and skips if no .gff file is there
    [ -e "$file" ] || continue

    # Use awk to count each feature type only in the third column
    read -r genes mrnas exons <<< "$(
        awk '
        BEGIN { g=0; m=0; e=0 }
        /^#/ { next }                 # skip comments
        { 
            if ($3 == "gene") g++
            else if ($3 == "mRNA") m++
            else if ($3 == "exon") e++
        }
        END { print g, m, e }
        ' "$file"
    )"

    #Put  the result line to the summary file
    echo -e "${file}\t${genes}\t${mrnas}\t${exons}" >> chromosome_summary.txt
done

echo "Summarized all .gff files into chromosome_summary.txt"

