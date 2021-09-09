# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if $(cmd-exist fzf); then
	export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info"
fi

# direnv
if $(cmd-exist direnv); then
	eval "$(direnv hook zsh)"
fi

# node
if [ -d "${HOME}/.volta" ]; then
	export VOLTA_HOME="$HOME/.volta"
	export PATH="$VOLTA_HOME/bin:$PATH"
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
if [ -f "$HOME/.cargo/env" ]; then
	source $HOME/.cargo/env
fi

# golang
if [ -d "$HOME/.goenv" ]; then
	export GOENV_ROOT=$HOME/.goenv
	export PATH=$GOENV_ROOT/bin:$PATH
	eval "$(goenv init -)"
fi
