# env {{{
export ZINIT_HOME=$HOME/.zinit
# }}}

# general {{{
export LANG=ja_JP.UTF-8
export EDITOR=vim
export PATH=$DOTFILES/bin:$PATH
fpath=($DOTFILES/zsh/functions $fpath)

setopt no_beep
# }}}

# zinit {{{
source ${ZINIT_HOME}/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
# }}}

source ${DOTFILES}/zsh/rc/history.zsh
source ${DOTFILES}/zsh/rc/complement.zsh
source ${DOTFILES}/zsh/rc/appearance.zsh
source ${DOTFILES}/zsh/rc/prompt.zsh
source ${DOTFILES}/zsh/rc/aliases.zsh
