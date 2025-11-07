#!/bin/bash

file="SLF_genomic.gff"

cut -f1 "$file" | grep -v '^#' | sort | uniq > chromosome_name.gff

while read chromosome_name
do
    chromosome_name=$(echo "$chromosome_name" | tr -d '\r')

    grep '^#' "$file" > "${chromosome_name}.gff"
    grep -v '^#' "$file" | grep -w "$chromosome_name" >> "${chromosome_name}.gff"

    echo "Wrote ${chromosome_name}.gff"

done < chromosome_name.gff
