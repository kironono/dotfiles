#!/bin/sh

set -e

# Default settings
DOTFILES=${DOTFILES:-~/.dotfiles}
REPO=${REPO:-kironono/ohmyzsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}


command_exists() {
    command -v "$@" >/dev/null 2>&1
}


main() {
    umask g-w,o-w

    command_exists git || {
        error "git is not installed"
            exit 1
        }

    git clone -c core.eol=lf -c core.autocrlf=false \
        -c fsck.zeroPaddedFilemode=ignore \
        -c fetch.fsck.zeroPaddedFilemode=ignore \
        -c receive.fsck.zeroPaddedFilemode=ignore \
        --depth=1 --branch "$BRANCH" "$REMOTE" "$DOTFILES" || {
        error "git clone of $REMOTE repo failed"
            exit 1
        }
}

main "$@"
