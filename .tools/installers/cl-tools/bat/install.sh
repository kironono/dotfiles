#!/bin/bash

set -ue

SRC_DIR=$HOME/.local/src
BIN_DIR=$HOME/.bin

version=v0.12.1
archi=$(uname -sm)


download() {
	echo "Downloading ..."
	pushd ${SRC_DIR}
	curl -fL https://github.com/sharkdp/bat/releases/download/${version}/${1}.tar.gz | tar -xzf -
	pushd ${1}
	cp bat ${BIN_DIR}/bat
}


case "$archi" in
	Darwin\ *64)     download bat-$version-x86_64-apple-darwin ;;
	Linux\ *64)      download bat-$version-x86_64-unknown-linux-gnu ;;
	*)               echo "not supported!" && exit 1 ;;
esac
