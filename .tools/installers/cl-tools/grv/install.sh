#!/bin/sh

set -ue

BIN_DIR=$HOME/.bin

archi=$(uname -sm)

install_for_mac() {
	brew install grv
}

install_for_linux() {
	pushd ${BIN_DIR}
	curl -fLo grv https://github.com/rgburke/grv/releases/download/v0.3.2/grv_v0.3.2_linux64
	chmod +x ./grv
}


case "$archi" in
	Darwin\ *64)
		install_for_mac
	;;
	Linux\ *64)
		install_for_linux
	;;
	*)
		echo "not supported!" && exit 1
	;;
esac

exit 0
