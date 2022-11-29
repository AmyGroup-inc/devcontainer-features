#!/bin/sh

set -eux

# Kusion version
VERSION=${VERSION:-"v0.7.1"}
KUSION_URL="https://github.com/KusionStack/kusion/releases/download/${VERSION}/kusion-ubuntu.tgz"
KUSION_LOCATION="/home/vscode/.kusion"

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
        fi
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Install dependencies
check_packages wget

echo "Activating feature 'Kusion'"
mkdir -p ${KUSION_LOCATION}
# install Kusion pack
wget -c  ${KUSION_URL} -qO - | tar xz -C ${KUSION_LOCATION}
# the kusion bin location is added to path by devcontainer-feature.json file