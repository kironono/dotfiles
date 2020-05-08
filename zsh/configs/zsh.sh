# env {{{
export ZINIT_HOME=$HOME/.zinit
# }}}

# general {{{
export LANG=ja_JP.UTF-8
export EDITOR=vim
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH
FPATH="${HOME}/.zsh/functions:${FPATH}"

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

source ${HOME}/.zsh/configs/history.zsh
source ${HOME}/.zsh/configs/complement.zsh
source ${HOME}/.zsh/configs/appearance.zsh
source ${HOME}/.zsh/configs/prompt.zsh
source ${HOME}/.zsh/configs/aliases.zsh
source ${HOME}/.zsh/configs/environment.zsh
source ${HOME}/.zsh/configs/keybinds.zsh
