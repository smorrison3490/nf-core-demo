
/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    PRINT PARAMS SUMMARY
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

log.info """\
         P R E P R O C E S S I N G    
         ===================================
         reference    : ${params.reference}
         reads        : ${params.reads}
         outdir       : ${params.outdir}
         """
         .stripIndent()

/**
 * Quality control fastq
 */

process FASTQC {

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

workflow PREPROCESSING {

    take:
    reads_ch

    main:
    FASTQC(reads_ch)

}
