#! /bin/bash

file="SLF_genomic.gff"

grep -v '^#' "$file" | cut -f1 | sort | uniq > chr_list.txt

while read Chromosome; do
	grep -v '^#' "$file" | grep "^$Chromosome" > "${Chromosome}.gff"
	echo "Wrote ${Chromosome}.gff"
done < chr_list.txt
