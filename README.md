# ![nf-core/mhcquant](https://raw.githubusercontent.com/nf-core/mhcquant/master/docs/images/mhcquant_logo.png)
**Identify and quantify peptides from mass spectrometry raw data**

[![Build Status](https://travis-ci.org/nf-core/mhcquant.svg?branch=master)](https://travis-ci.org/nf-core/mhcquant)
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A50.32.0-brightgreen.svg)](https://www.nextflow.io/)

[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg)](http://bioconda.github.io/)
[![Docker](https://img.shields.io/docker/automated/nfcore/mhcquant.svg)](https://hub.docker.com/r/nfcore/mhcquant)
![Singularity Container available](
https://img.shields.io/badge/singularity-available-7E4C74.svg)
[![Slack Status](https://nf-core-invite.herokuapp.com/badge.svg)](https://nf-core-invite.herokuapp.com)

### Introduction
nfcore/mhcquant is a bioinformatics analysis pipeline used for quantitative processing of data dependant (DDA) peptidomics data.

It was specifically designed to analyse immunopeptidomics data, which deals with the analysis of affinity purified, unspecifically cleaved peptides that have recently been discussed intensively in the context of cancer vaccines. (https://www.nature.com/articles/ncomms13404)

The workflow is based on the OpenMS C++ framework for computational mass spectrometry. RAW files (mzML) serve as inputs and a database search (Comet) is performed based on a given input protein database. FDR rescoring is applied using Percolator 3.0 based on a competitive target-decoy approach (reversed decoys). For label free quantification all input files undergo identification based retention time alignment (MapAlignerIdentification), and targeted feature extraction matching ids between runs (FeatureFinderIdentification). In addition, a variant calling file (vcf) can be specified to translate variants into proteins that will be included in the database search and binding predictions on specified alleles (alleles.tsv) using MHCFlurry can be directly run on the output peptide lists.

The pipeline is built using Nextflow, a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It comes with docker / singularity containers making installation trivial and results highly reproducible.

### Documentation
The nf-core/mhcquant pipeline comes with documentation about the pipeline, found in the `docs/` directory:

### Run
```
nextflow run nf-core/mhcquant --mzmls '*.mzML' --fasta 'SWISSPROT_12_2018.fasta' --alleles 'alleles.tsv' --vcf 'variants.vcf' --include_proteins_from_vcf --run_prediction -profile standard,docker
```

1. [Installation](docs/installation.md)
2. Pipeline configuration
    * [Local installation](docs/configuration/local.md)
    * [Adding your own system](docs/configuration/adding_your_own.md)
3. [Running the pipeline](docs/usage.md)
4. [Output and how to interpret the results](docs/output.md)
5. [Troubleshooting](docs/troubleshooting.md)
