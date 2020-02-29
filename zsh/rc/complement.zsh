# complement {{{
autoload -Uz compinit
compinit

setopt correct
setopt correct_all

setopt hist_expand

setopt list_types

setopt auto_list

setopt auto_menu

setopt auto_param_slash

setopt mark_dirs

setopt nolistbeep

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' menu select
# }}}
