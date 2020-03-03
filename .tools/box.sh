#!/bin/sh

set -ue

SRC_DIR=$HOME/.local/src
BIN_DIR=$HOME/.bin

[ ! -d "$SRC_DIR" ] && mkdir -p ${SRC_DIR}
[ ! -d "$BIN_DIR" ] && mkdir -p ${BIN_DIR}

exit 0
