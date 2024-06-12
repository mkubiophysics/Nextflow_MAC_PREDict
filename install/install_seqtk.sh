#!/bin/bash

# Define variables
SEQTK_VERSION="1.4"
INSTALL_DIR="/usr/local/bin"

# Download Seqtk source code
wget -q "https://github.com/lh3/seqtk/archive/v${SEQTK_VERSION}.tar.gz" -O seqtk.tar.gz

# Extract Seqtk source code
tar -xzvf seqtk.tar.gz

# Compile Seqtk
cd seqtk-${SEQTK_VERSION}
make

# Install Seqtk binary
sudo cp seqtk ${INSTALL_DIR}

# Verify installation
#seqtk --version
