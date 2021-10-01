#!/bin/bash

set -ue

SRC_DIR=$HOME/.local/src
BIN_DIR=$HOME/.bin

version=0.8.3
archi=$(uname -sm)


download() {
    echo "Downloading ..."
    pushd ${SRC_DIR}
    curl -fL https://github.com/dandavison/delta/releases/download/${version}/${1}.tar.gz | tar -xzf -
    pushd ${1}
    cp delta ${BIN_DIR}/
}


case "$archi" in
    Darwin\ *64)     download delta-$version-x86_64-apple-darwin ;;
    Linux\ *64)      download delta-$version-x86_64-unknown-linux-gnu ;;
    *)               echo "not supported!" && exit 1 ;;
esac
