#!/bin/sh
set -e

echo "Activating feature 'Kusion'"

# Kusion version
VERSION=${VERSION:-"v0.7.1"}
KUSION_URL="https://github.com/KusionStack/kusion/releases/download/${VERSION}/kusion-ubuntu.tgz"

KUSION_LOCATION="~/.kusion"
mkdir -p ${KUSION_LOCATION}

# install Kusion pack
wget -c  ${KUSION_URL} -qO - | tar xz -C ${KUSION_LOCATION}

# add ${KUSION_LOCATION} to ${PATH}
export PATH=$PATH:${KUSION_LOCATION}/bin:${KUSION_LOCATION}/kclvm/bin