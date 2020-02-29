# env {{{
#
export ZINIT_HOME=$HOME/.zinit
export EDITOR=vim
# }}}

# zinit {{{
#
source ${ZINIT_HOME}/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
# }}}

# path {{{
#
export PATH=$DOTFILES/bin:$PATH
fpath=($DOTFILES/zsh/functions $fpath)
# }}}

# colors {{{
#
autoload -Uz colors
colors
# }}}

# complement {{{
#
autoload -Uz compinit
compinit

setopt correct
zstyle ':completion:*' menu select
# }}}

source ${DOTFILES}/zsh/rc/history.zsh
source ${DOTFILES}/zsh/rc/prompt.zsh
source ${DOTFILES}/zsh/rc/aliases.zsh
