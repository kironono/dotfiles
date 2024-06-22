#!/bin/bash

set -ue

SRC_DIR=$HOME/.local/src
BIN_DIR=$HOME/.bin

version=0.10.1
archi=$(uname -sm)

download() {
	echo "Downloading ..."

	pushd ${SRC_DIR}

	local url=https://github.com/ogham/exa/releases/download/v${version}/${1}-v${version}.zip
	local temp=${SRC_DIR}/exa.zip

	curl -fLo "$temp" $url && unzip -o "$temp" && rm -f "$temp"
	cp bin/exa ${BIN_DIR}/exa
}

case "$archi" in
	Darwin\ *64)     download exa-macos-x86_64 ;;
	Linux\ *64)      download exa-linux-x86_64 ;;
	*)               echo "not supported!" && exit 1 ;;
esac

exit 0
