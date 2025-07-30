# Jackal Metabarcoding Pipeline

This repository contains a DNA metabarcoding analysis pipeline using [USEARCH](https://drive5.com/usearch/) v11.

## 📁 Folder Structure

DNA_trail/
├── Fastq_jackal/ # Contains input FASTQ files and output/
├── usearch_pipeline.sh # Your full analysis pipeline
└── README.md # This file
## 🧪 Pipeline Steps

1. Quality filtering (`-fastq_maxee 1.0`)
2. Dereplication
3. OTU clustering (97% identity)
4. OTU table generation

## ▶️ How to Run

```bash
chmod +x usearch_pipeline.sh
./usearch_pipeline.sh

Then save and exit:

- Press `Ctrl + O` → `Enter`
- Then `Ctrl + X`

---

### ✅ 2. Now Add and Commit It

```bash
git add README.md
git commit -m "Add README.md with pipeline details"

