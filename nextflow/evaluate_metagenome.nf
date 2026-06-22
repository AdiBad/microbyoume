nextflow.enable.dsl=2
process run_fastqc {
    conda 'qc_env'
    publishDir 'results/fastqc', mode: 'move'

    input: 
    tuple val(sample), path(reads)

    output: 
    tuple val(sample), path('fastqc/${sample}')

    script:
    """
    mkdir -p fastqc/${sample}
    fastqc ${reads[0]} ${reads[1]} -o fastqc/${sample}
    """
}

process run_multiqc {
    conda 'qc_env'
    publishDir 'results/multiqc', mode: 'move'

    input: path fastq_dirs

    output: path 'multiqc_report.html'

    script:
    """
    multiqc ${fastq_dirs} -o .
    """
}

workflow{
    read_pairs  = Channel.fromFilePairs(
        params.reads, flat: true).set{read_pairs}
        .view { "INPUT: $it" }
    fastqc_results = run_fastqc(read_pairs)
    .view { "FASTQC OUTPUT: $it" }
    run_multiqc(fastqc_results.collect())
     .view { "MULTIQC INPUT: $it" }
}