#!/bin/bash

# Define variables
BLAST_VERSION="2.12.0"
INSTALL_DIR="/usr/local/blast"

# Create installation directory
sudo mkdir -p ${INSTALL_DIR}

# Download BLAST installer
wget -q "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz" -O blast.tar.gz

# Extract BLAST installer
tar -xzvf blast.tar.gz -C ${INSTALL_DIR}

# Add BLAST binaries to the PATH
echo "export PATH=\$PATH:${INSTALL_DIR}/ncbi-blast-${BLAST_VERSION}+/bin" >> ~/.bashrc
source ~/.bashrc

# Test BLAST installation
blastn -version
