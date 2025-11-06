#!/bin/bash

features=("gene" "mRNA" "exon")

echo -e "Chromosome\tgene\tmRNA\texon" > chromosome_summary.txt

for file in NC_*.gff
do
    chr="${file%.gff}"
    line="$chr"

    for feature in "${features[@]}"
    do
        count=$(grep -v '^#' "$file" | cut -f3 | grep -x "$feature" | wc -l)
        line="$line\t$count"
    done

    echo -e "$line" >> chromosome_summary.txt
done

cat chromosome_summary.txt
echo "Completed chromosome_summary.txt"
