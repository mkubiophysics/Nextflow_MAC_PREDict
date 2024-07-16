#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.readsDir = "${projectDir}/"
params.reads1 = params.readsDir + "*R1.fastq"
params.reads2 = params.readsDir + "*R2.fastq"
params.outdir = "${projectDir}/results/"

workflow {

    // Define your workflow steps
    ConvertToFasta(params.reads1, params.reads2)
    makeBlastDatabase(ConvertToFasta.out.databasefile)
}


/*
 * Process 1A: Create a FASTA file from Fastq file with seqtk
 */
 
process ConvertToFasta {

    publishDir params.outdir

    input:
    path reads1
    path reads2
    
    output:
    path "${reads1.baseName}.fa"
    path "${reads2.baseName}.fa"
    path "database" , emit: databasefile

    script:
    """
    seqtk seq -A ${reads1} > ${reads1.baseName}.fa
    seqtk seq -A ${reads2} > ${reads2.baseName}.fa
    cat ${reads1.baseName}.fa ${reads2.baseName}.fa > database
    """
}

/*
 * Process 1B: Create BLAST database
 */
process makeBlastDatabase {

	publishDir params.outdir

    input:
    path database

    output:
    path "${database}.*"

    script:
    """
    makeblastdb -dbtype nucl -in ${database} 
    """
}
