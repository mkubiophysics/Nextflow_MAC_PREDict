# Nextflow_MAC_PREDict
A nextflow pipeline to identify Mycobacterium Avium Complexes (MACs) from Whole Metagenomic Sequencing (WMS) reads


# Introduction

MAC_PREDict pipeline was developed by Manish Kumar's lab and is written in Nextflow. This pipeline helps in the identification of MAC species and subspecies as well as to discover new MAC members

# Installation

To install the Nextflow MAC PREDict pipeline:

First clone the repository into a local directory:

```
git clone https://github.com/mkubiophysics/Nextflow_MAC_PREDict.git
$ cd Nextflow_MAC_PREDict
```
And then run the following commands while in the repository:

```
$ cd install
$ bash install_blast.sh
$ bash install_seqtk.sh
```
This script installs the following pipeline component software:

. seqtk

. BLAST

# Prepare Input files

. Pair-end reads with `R1.fastq` and `R2.fastq` extensions in the `$projectDir`

. GSOligos.txt in the `$projectDir`

# Running the pipeline

To install Nextflow: 

```
curl -s https://get.nextflow.io | bash
```
or visit [https://www.nextflow.io/docs/latest/install.html]

To run the pipeline on a metagenomic samples, the raw reads such as `*R{1,2}.fastq.gz` and `*R{1,2}.fastq.tar.gz` should be `unzipped`. Define the `Directory` of `reads` i.e., `$projectDir`. First, try to run with sample files in `Directory: Examples` visit [https://doi.org/10.6084/m9.figshare.26312170.v1]

Then, to run the pipeline from the terminal call:

```
nextflow run create_db.nf -w /path/to/the/directory/with/sample/reads

For Example nextflow run create_db.nf -w /DATA/Manisha_aswal/MAC_predictor/
```
This pipeline will create database

```
nextflow run MAC_PREDict.nf -w /path/to/the/directory/where/above/process/was/run

For Example nextflow run create_db.nf -w /DATA/Manisha_aswal/MAC_predictor/
```
This pipeline will predict MAC from mNGS reads 

# Output Files

A Directory `results` will be created in `$projectDir` that will contain main output files such as:

. Blast_result = Complete result of Blastn

. GE_hits = MAC specific hits

. SPA_hits = *Mycobacterium avium subsp. avium* specific hits

. SPP_hits = *Mycobacterium avium subsp. paratuberculosis* specific hits

. SPH_hits = *Mycobacterium avium subsp. hominissius* specific hits

. SPC_hits = *Mycobacterium chimera* specific hits

. SPI_hits = *Mycobacterium intracellulare* specific hits

# Designing of GSOligos 

For detailed information about designing of GSOligos could be found at [https://github.com/mkubiophysics/GSOligos-Database]

# Pipeline Algorithm
![flow_chart](https://github.com/user-attachments/assets/f681b6fe-cd4d-4a92-89a1-3b0dfff27bf1)

# Developer info

Manisha Aswal (maswal@biophysics.du.ac.in)

