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

println "reads: $params.reads"

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