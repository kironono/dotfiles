# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if $(cmd-exist fzf); then
	export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info"
fi

# node
if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# rust
if [ -d "$HOME/.cargo" ]; then
	source $HOME/.cargo/env
fi
