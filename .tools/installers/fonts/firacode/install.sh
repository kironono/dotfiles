#!/bin/bash

set -ue

archi=$(uname -sm)

install_for_mac() {
    brew install --cask font-fira-code
    brew install --cask font-fira-code-nerd-font
}

install_for_linux() {
    sudo apt install fonts-firacode
}


case "$archi" in
    Darwin\ *64)
        install_for_mac
        ;;
    Linux\ *64)
        install_for_linux
        ;;
    *)
        echo "${archi} not supported"
        exit 1
        ;;
esac


exit 0;
