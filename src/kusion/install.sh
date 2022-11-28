#!/bin/sh
set -e

echo "Activating feature 'Kusion'"

# Kusion version
VERSION=${VERSION:-"v0.7.1"}
KUSION_URL="https://github.com/KusionStack/kusion/releases/download/${VERSION}/kusion-ubuntu.tgz"

KUSION_LOCATION="~/.kusion"
mkdir -p ${KUSION_LOCATION}

echo ${KUSION_URL}
echo ${KUSION_LOCATION}

# install Kusion pack
wget -c  ${KUSION_URL} -qO - | tar xz -C ${KUSION_LOCATION}


ls ${KUSION_LOCATION}
echo $PATH

location=$(which kusion)
echo ${KUSION_LOCATION}

result=$(kusion)
echo ${result}