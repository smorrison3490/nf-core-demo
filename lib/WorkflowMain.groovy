//
// This file holds several functions specific to the main.nf workflow in the nf-core/sarek pipeline
//

import nextflow.Nextflow

class WorkflowMain{
    
    //
    // Get attribute from genome config file e.g. fasta
    //
    public static Object getGenomeAttribute(params, attribute) {
        if (params.attribute){
            return params.attribute
        }
        return null
    }

}
