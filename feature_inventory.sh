#! /bin/bash

file="SLF_genomic.gff"

total=$(grep -v '^#' "$file" | cut -f3 | wc -l)

genes=$(grep -v '^#' "$file" | cut -f3 | grep -x "gene" | wc -l)
mrnas=$(grep -v '^#' "$file" | cut -f3 | grep -x "mRNA" | wc -l)
exons=$(grep -v '^#' "$file" | cut -f3 | grep -x "exon" | wc -l)

echo "Total number of features: $total"
echo -e "gene:\t$genes"
echo -e "mRNA:\t$mrnas"
echo -e "exon:\t$exons"
