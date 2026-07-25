conda.enabled = true
params{
    reads = '/data/FASTQ/DNA/*_{R1,R2}.fastq.gz'
}

process {
    cpus = 2
    memory = '2 GB'
}

executor {
    name = 'local'
}