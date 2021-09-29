#!/bin/bash

set -ue

SRC_DIR=$HOME/.local/src
BIN_DIR=$HOME/.bin

version=1.2.0
archi=$(uname -sm)


download() {
    echo "Downloading ..."
    pushd ${SRC_DIR}
    curl -fL https://github.com/magicdrive/git-gh-diff-url/archive/refs/tags/v${version}.tar.gz | tar -xzf -
    pushd "git-gh-diff-url-${version}"
    sed -i.bak "s|PREFIX=\${HOME}/local|PREFIX=${HOME}/.local|" Makefile
    make install
}


case "$archi" in
    Darwin\ *64)     download ;;
    Linux\ *64)      download ;;
    *)               echo "not supported!" && exit 1 ;;
esac
