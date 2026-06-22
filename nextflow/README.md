## Nextflow installation process

Please ensure you are on linux/WSL system.

In order to launch nextflow, follow below steps:

Install latest java-jre version to allow nextflow installation.
```
sudo apt update
sudo apt install -y openjdk-17-jdk
java --version
```

Now install nextflow.
```
curl -s https://get.nextflow.io | bash
sudo mv nextflow /usr/local/bin/
nextflow -version
```

### Tools installation

I have 2 main conda environments:

```mermaid
flowchart TD
    subgraph qc_env
        B1[fastp]
        B2[FastQC]
        B3[MultiQC]
    end

    subgraph metaphlan_env
        D1[MetaPhlAn]
        D2[Bowtie2 Mapping]
    end
```

1. Quality check (qc_env)
```mermaid
flowchart LR
    A[Raw Metagenomic Reads<br/>FASTQ R1/R2] --> B[fastp<br/>Trimming & Filtering]
    B --> C[FastQC<br/>Per-sample QC reports]
    C --> D[MultiQC<br/>Aggregate QC report]
    D --> E[Cleaned Reads Ready for Analysis]
```

> `conda create -n qc_env -c bioconda -c conda-forge fastqc fastp multiqc`

2. Classification (metaphlan_env)
```mermaid
flowchart LR
    A[Clean Reads<br/>from QC pipeline] --> B[MetaPhlAn<br/>Taxonomic profiling]
    B --> C[Species Abundance Table]
    C --> D[Profile Merging<br/>Across samples]
    D --> E[Visualization<br/>Barplots / Heatmaps / PCA]
```

> `conda create -n metaphlan_env -c bioconda -c conda-forge metaphlan bowtie2`

### Launch pipeline

If you create new experimental configs to pass paths or configure cores, launch:

> `nextflow run nextflow/evaluate_metagenome.nf -c nextflow/experiemnts/20260623/config.nf`<br>
replacing path to config file of your choice