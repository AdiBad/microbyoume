conda.enabled = true
params{
    reads = '/home/adibad/projects/microbyoume/data/FASTQ/DNA/*_{R1,R2}.fastq.gz'
}

process {
    cpus = 2
    memory = '2 GB'
}

executor {
    name = 'local'
}