nextflow.enable.dsl=2

process run_fastqc{
    conda 'qc_env'
    publishDir 'results', mode: 'move'

    input: tuple val(sample), path(reads)

    output: path 'fastqc/${sample}/*'

    script:
    """
    mkdir fastqc/${sample}
    fastqc ${reads[0]} ${reads[1]} -o fastqc/${sample}
    """
}

process run_multiqc{
    input: path fastq_dirs

    output: 'multiqc_report.html'

    script:
    """
    multiqc ${fastq_dirs} -o ${fastq_dirs}
    """
}

workflow{
    Channel.fromFilePairs(params.reads, flat: True).set{read_pairs}
    fastqc_results = run_fastqc(read_pairs)
    multiqc = run_multiqc(fastqc_results.collect())
}