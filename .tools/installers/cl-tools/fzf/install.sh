#!/bin/sh

set -ue

FZF_DIR=$HOME/.fzf

if [ ! -d "$FZF_DIR" ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR
fi

pushd $FZF_DIR

git pull && ./install --key-bindings --completion --no-update-rc
