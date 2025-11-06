#! /bin/bash

file="SLF_genomic.gff"

echo -e "Chromosome\tGeneCount"

grep -v '^#' "$file" | cut -f1,3 | grep -w "gene" | cut -f1 | sort | uniq -c | while read GeneCount Chromosome; do
	echo -e "$Chromosome\t$GeneCount"
done
