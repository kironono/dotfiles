#!/bin/sh

set -ue

# Default settings
DOTFILES=${DOTFILES:-~/.dotfiles}
REPO=${REPO:-kironono/dotfiles}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}
ZINIT_HOME=${ZINIT_HOME:-~/.zinit}


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
	echo ${GREEN}"Installing dotfiles ..."${RESET}

	if [ -d "$DOTFILES" ]; then
		cat <<-EOF
			${YELLOW}You already have dotfiles installed.${RESET}
			You'll need to remove '$DOTFILES' if you want to reinstall.
		EOF
		return
	fi

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

install_zinit() {
	echo ${GREEN}"Installing zinit ..."${RESET}
	if [ -d "$ZINIT_HOME/bin" ]; then
		cat <<-EOF
			${YELLOW}You already hove zinit installed.${RESET}
		EOF
		return
	fi

	if [ ! -d $ZINIT_HOME ]; then
		mkdir ${ZINIT_HOME}
	fi

	command_exists git || {
		error "git is not installed"
			exit 1
		}

	git clone https://github.com/zdharma/zinit.git ${ZINIT_HOME}/bin
}

setup_rcm() {
	echo ${GREEN}"Setup rcm ..."${RESET}

	command_exists rcup || {
		error "rcm is not installed"
			exit 1
		}

	env RCRC=$DOTFILES/rcrc rcup
}

main() {
	setup_color

	install_dotfiles
	install_zinit

	setup_rcm

	printf "${GREEN}"
	cat <<-'EOF'
		      _       _    __ _ _           
		     | |     | |  / _(_) |          
		   __| | ___ | |_| |_ _| | ___  ___ 
		  / _` |/ _ \| __|  _| | |/ _ \/ __|
		 | (_| | (_) | |_| | | | |  __/\__ \
		(_)__,_|\___/ \__|_| |_|_|\___||___/
		
		... is now installed!
	EOF
	printf "${RESET}"

	exec $SHELL -l
}

main "$@"
