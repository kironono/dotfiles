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

# twilio autocomplete setup
TWILIO_AC_ZSH_SETUP_PATH="${HOME}/.twilio-cli/autocomplete/zsh_setup" && test -f $TWILIO_AC_ZSH_SETUP_PATH && source $TWILIO_AC_ZSH_SETUP_PATH;
