#!/bin/bash

set -ue

SRC_DIR=$HOME/.local/src
BIN_DIR=$HOME/.bin

version="nightly"
archi=$(uname -sm)

download() {
    echo "Downlading ..."
    pushd "${SRC_DIR}"
    curl -fL https://github.com/neovim/neovim/releases/download/${version}/${1}.tar.gz | gunzip | tar x --strip-components=1 -C ~/.local
}

case "$archi" in
	Darwin\ *64)  download nvim-macos ;;
	Linux\ *64)   download nvim-linux64 ;;
	*)            echo "not supported!" && exit 1 ;;
esac

exit 0;
