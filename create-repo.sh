#!/bin/bash
# This script creates an arch repository layout in the current directory.
set -e

# Dump gpg private key into a file
echo "$private_key" >gpg-private-key.gpg

# import gpg private key
gpg --import gpg-private-key.gpg
# Dump public key into a file
echo "$public_key" >public_key.gpg

# Create dirs
mkdir -p repodata/x86_64
cd repodata/x86_64

# Copy packages
cp -r ../../*.pkg.tar.gz .
# Sign packages
echo "Signing packages"
# Gpg doesnt support wildcards -> iterate over all packages that match the pattern
for package in eupnea-*.pkg.tar.gz; do gpg --detach-sig $package; done || true
for package in keyd-*.pkg.tar.gz; do gpg --detach-sig $package; done || true
gpg --detach-sig cgpt-vboot-utils*.pkg.tar.gz || true

# Create repo and sign it
repo-add -s ./eupnea.db.tar.gz *.pkg.tar.gz
