# nf-core-demo

The following pipeline performs a `fastqc` quality check on paired-ends reads for a bacteriophage. The results are output to a newly created directory called `results`.

## Getting Started

I. In the base directory, build a Docker image called `my-demo`:

```docker build -t my-demo .```

II. Run the nextflow script `script1.nf` inside of the docker container. The docker configurations are in `nextflow.config` therefore you would just need to run:

```nextflow run script1.nf```

The output from nextflow script will appear in the newly created `results/` directory. 

You can disable docker by modifying the `docker.enabled = true` line in `nextflow.config`. However, make sure you have `fastqc` installed locally.

## nf-core

`main.nf` is the same nextflow pipe but attempts to follow the [nf-core guidelines](https://nf-co.re/docs/contributing/guidelines) and best practices. 
