#!/bin/sh

set -ue

export NVM_DIR=$HOME/.nvm

if [ ! -d "$NVM_DIR" ]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fi
