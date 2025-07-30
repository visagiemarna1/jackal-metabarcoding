#!/bin/bash

# Define input and output directories
WORKDIR=~/Documents/DNA_trail/Fastq_jackal
OUTDIR=$WORKDIR/output
mkdir -p "$OUTDIR"
cd "$WORKDIR" || exit 1

# STEP 1: Quality filtering
echo "🔍 Filtering FASTQ files..."
for fq in *.fastq; do
    base=$(basename "$fq" .fastq)
    usearch -fastq_filter "$fq" -fastq_maxee 1.0 -fastaout "$OUTDIR/${base}_filtered.fa"
done

# STEP 2: Combine all filtered reads
echo "📦 Combining filtered reads..."
cat "$OUTDIR"/*_filtered.fa > "$OUTDIR/all_filtered.fa"

# STEP 3: Dereplication
echo "🔁 Dereplicating..."
usearch -fastx_uniques "$OUTDIR/all_filtered.fa" -sizeout -relabel Uniq -fastaout "$OUTDIR/uniques.fa"

# STEP 4: OTU clustering at 97%
echo "🔗 Clustering OTUs..."
usearch -cluster_otus "$OUTDIR/uniques.fa" -otus "$OUTDIR/otus.fa"

# STEP 5: Mapping to OTUs
echo "🧬 Generating OTU table..."
usearch -usearch_global "$OUTDIR/all_filtered.fa" -db "$OUTDIR/otus.fa" -strand plus -id 0.97 -otutabout "$OUTDIR/otu_table.txt"

echo "✅ DONE! All results are in: $OUTDIR"

