#!/usr/bin/env nextflow

nextflow.enable.dsl=2

log.info """\
         P I P E L I N E    
         ===================================
         reference    : ${params.reference}
         reads        : ${params.reads}
         outdir       : ${params.outdir}
         """
         .stripIndent()

/**
 * Quality control fastq
 */

reads_ch = Channel.fromFilePairs( params.reads, checkIfExists: true)

reads_ch.view()
    
process fastqc {

    publishDir "$params.outdir"

    input:
    tuple val(sample_id), path(reads)

    output:
    file("*.{html,zip}")
    
    script:
    """
    fastqc -t 10 ${reads[0]} ${reads[1]}
    """
}

workflow {
    fastqc(reads_ch)
}
