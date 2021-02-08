# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if $(cmd-exist fzf); then
	export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info"
fi

# node
if [ -d "$HOME/.nvm" ]; then
	lazynvm() {
		unset -f nvm node npm npx
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
	}
	nvm() {
		lazynvm
		nvm $@
	}
	node() {
		lazynvm
		node $@
	}
	npm() {
		lazynvm
		npm $@
	}
	npx() {
		lazynvm
		npx $@
	}
fi

# python
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi
# python poetry
if [ -d "$HOME/.poetry" ]; then
	source $HOME/.poetry/env
fi

# rust
if [ -d "$HOME/.cargo" ]; then
	source $HOME/.cargo/env
fi

# golang
if [ -d "$HOME/.goenv" ]; then
	export GOENV_ROOT=$HOME/.goenv
	export PATH=$GOENV_ROOT/bin:$PATH
	eval "$(goenv init -)"
fi
