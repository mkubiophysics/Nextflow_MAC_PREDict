#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.readsDir = "${projectDir}/"
params.query = params.readsDir + "GSOligos.txt"
params.outdir = "${projectDir}/results/"
params.db = params.outdir + "database"

db_name = file(params.db).name
db_dir = file(params.db).parent


workflow {
	 // Define your workflow steps
	 blastSearch(params.query, db_dir)
}

/*
 * Process 1A: Run BLASTn
 */

process blastSearch {

	publishDir params.outdir

    input:
    path query
    path  db

    output:
    path "blast_result"
    path "GE_hits"
    path "SPA_hits"
    path "SPP_hits"
    path "SPH_hits"
    path "SPC_hits"
    path "SPI_hits"

    """
    blastn -db $db/$db_name -query $query -evalue 10 -word_size 18 -qcov_hsp_perc 100 -outfmt 6 > blast_result
    cat blast_result | grep '^GE' > GE_hits	  
    cat blast_result | grep '^SPA' > SPA_hits
    cat blast_result | grep '^SPP' > SPP_hits
    cat blast_result | grep '^SPH' > SPH_hits
    cat blast_result | grep '^SPC' > SPC_hits
    cat blast_result | grep '^SPI' > SPI_hits
    """
}