#!/bin/sh

set -ue

export PYENV_DIR=$HOME/.pyenv
export POETRY_DIR=$HOME/.poetry

if [ ! -d "$PYENV_DIR" ]; then
    git clone https://github.com/pyenv/pyenv.git $PYENV_DIR
fi

if [ ! -d "$POETRY_DIR" ]; then
    curl -sSL https://install.python-poetry.org | python3 -
fi
