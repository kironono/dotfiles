#!/bin/sh

set -ue

export NODENV_DIR="${HOME}/.nodenv"

if [ ! -d "${NODENV_DIR}" ]; then
    git clone https://github.com/nodenv/nodenv.git "${NODENV_DIR}"
    mkdir -p "${NODENV_DIR}"/plugins
    git clone https://github.com/nodenv/node-build.git "${NODENV_DIR}"/plugins/node-build
fi
