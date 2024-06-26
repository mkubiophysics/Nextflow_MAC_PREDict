# Nextflow_MAC_PREDict
A nextflow pipeline to identify Mycobacterium Avium Complexes (MACs) from metagenomic reads


# Introduction

MAC_PREDict pipeline was developed by Manish Kumar's lab and is written in Nextflow. This pipeline helps in the identification of MAC species and subspecies as well as to discover new MAC members

# Installation

To install the Nextflow MAC PREDict pipeline:

First clone the rpository into a local directory:

```
git clone https://github.com/mkubiophysics/Nextflow_MAC_PREDict.git
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

# Running the pipeline

To install Nextflow: 

```
curl -s https://get.nextflow.io | bash
```
or visit [https://www.nextflow.io/docs/latest/install.html]

To run the pipeline on a metagenomic samples, the raw reads such as `*R{1,2}.fastq.gz` and `*R{1,2}.fastq.tar.gz` should be `unzipped`. Define the `Directory` of `reads`. 

Then, to run the pipeline from the terminal call:

```
nextflow run create_db.nf
```
This pipeline will create database

```
nextflow run MAC_PREDict.nf
```
This pipeline will predict MAC from mNGS reads using --queryFile `GSOligos.txt` --numThreads `8` --evalueThreshold `1e-10` --blastOptions '-max_target_seqs 10'
