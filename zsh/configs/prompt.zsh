# prompt {{{
#
# %b branch
# %a action
# %c changes
# %u uncommit
# vcs_info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { vcs_info }

# prompt left
PROMPT='%{$fg[yellow]%}[%n%{$fg[green]%}@%m%{${fg[blue]}%}:%(4~,%-1~/.../%2~,%~)]%{$reset_color%}'
PROMPT=$PROMPT' ${vcs_info_msg_0_}%{${fg[white]}%}%}%#%{${reset_color}%} '
# prompt right
RPROMPT='%{${fg[blue]}%}[%~]%{${reset_color}%}'
# }}}
