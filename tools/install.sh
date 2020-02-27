#!/bin/sh

set -e

# Default settings
DOTFILES=${DOTFILES:-~/.dotfiles}
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
	if [ -d "$DOTFILES" ]; then
		cat <<-EOF
			${YELLOW}You already have dotfiles installed.${RESET}
			You'll need to remove '$DOTFILES' if you want to reinstall.
		EOF
		exit 1
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

install_zsh_plugins() {
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
}

setup_zsh() {
	if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
		OLD_ZSHRC=~/.zshrc.backup-$(date +%Y-%m-%d_%H-%M-%S)
		echo "${YELLOW}Found ~/.zshrc.${RESET} ${GREEN}Backing up to ${OLD_ZSHRC}${RESET}"
		mv ~/.zshrc "$OLD_ZSHRC"
	fi

	sed "/^export DOTFILES=/ c\\
export DOTFILES=\"$DOTFILES\"
" "$DOTFILES/templates/zshrc" > ~/.zshrc-temp
	mv -f ~/.zshrc-temp ~/.zshrc
}

main() {
	setup_color

	# install_dotfiles
	install_zsh_plugins
	setup_zsh
}

main "$@"
