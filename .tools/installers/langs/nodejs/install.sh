#!/bin/sh

set -ue

export VOLTA_DIR="${HOME}/.volta"

if [ ! -d "${VOLTA_DIR}" ]; then
    curl https://get.volta.sh | bash -s -- --skip-setup
fi
