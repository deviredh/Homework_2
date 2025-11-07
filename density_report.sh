#!/bin/bash

bash genes_per_chromosome.sh > density_counts.txt

echo -e "Chromosome\tGeneCount\tClass" > density_report.txt

tail -n +2 density_counts.txt | while read chromosome genecount
do
    if [ "$genecount" -gt 2000 ]; then
        class="High-density"
    else
        class="Low-density"
    fi

    echo -e "$chromosome\t$genecount\t$class" >> density_report.txt
done

cat density_report.txt
