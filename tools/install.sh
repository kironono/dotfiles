#!/bin/sh

set -e

# Default settings
DOTFILES=${DOTFILES:-~/.dotfiles.develop}
REPO=${REPO:-kironono/dotfiles}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-develop}


setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

error() {
	echo ${RED}"Error: $@"${RESET} >&2
}

install_dotfiles() {
	umask g-w,o-w

	command_exists git || {
		error "git is not installed"
			exit 1
		}

	git clone --branch "$BRANCH" "$REMOTE" "$DOTFILES" || {
		error "git clone of $REMOTE repo failed"
			exit 1
		}
}

main() {
	setup_color

	if [ -d "$DOTFILES" ]; then
		cat <<-EOF
			${YELLOW}You already have dotfiles installed.${RESET}
			You'll need to remove '$DOTFILES' if you want to reinstall.
		EOF
		exit 1
	fi

	install_dotfiles
}

main "$@"
