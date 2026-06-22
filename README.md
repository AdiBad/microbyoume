# microbyoume
Collecting interesting statitsical and graphical representations of microbiome specific data visualizations.

## Data information

Occular fluid metagenome collected from: 

> Normal eye: https://www.ebi.ac.uk/ena/browser/view/SAMN05362836?show=reads

> Infected eye: https://www.ebi.ac.uk/ena/browser/view/SAMN05362796?show=reads

## Workflows followed

Classic metagenomics workflow for shotgun reads processing

```mermaid
flowchart LR
    A[Metagenomic Reads<br/>R1/R2 FASTQ] --> B[Quality Control<br/>FastQC]
    B --> C[Read Trimming & Filtering<br/>fastp]
    C --> D[Taxonomic Classification<br/>MetaPhlAn]
    D --> E[Visualization & Comparison<br/>Barplots, Heatmaps, Krona]
```

Classic RNAseq (metatranscriptomic) workflow 

```mermaid
flowchart LR
    A[Metatranscriptomic Reads<br/>RNA-seq FASTQ] --> B[Quality Control<br/>FastQC]
    B --> C[Trimming & Filtering<br/>fastp]
    C --> D[rRNA Removal<br/>SortMeRNA / BBDuk]
    D --> E[Mapping OR Assembly<br/>Bowtie2 / BWA / MEGAHIT]
    E --> F[Functional Annotation<br/>KEGG / eggNOG / HUMAnN]
    F --> G[Interpretation & Visualization<br/>Pathways, Heatmaps, Networks]
```

