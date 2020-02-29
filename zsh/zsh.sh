#
# path
#
export PATH=$DOTFILES/bin:$PATH
fpath=($DOTFILES/zsh/functions $fpath)

#
# history
#
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

#
# env
#
export EDITOR=vim

#
# colors
#
autoload -Uz colors
colors

#
# complement
#
autoload -Uz compinit
compinit

setopt correct
zstyle ':completion:*' menu select

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# prompt
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
PROMPT='%{$fg[green]%}[%n%{$fg[blue]%}@%m]%{$reset_color%}'
PROMPT=$PROMPT' ${vcs_info_msg_0_}%{${fg[white]}%}%}$%{${reset_color}%} '
# prompt right
RPROMPT='%{${fg[blue]}%}[%~]%{${reset_color}%}'

#
# alias
#
alias ls='ls -G'
alias ll='ls -alF'
alias pwdc='pwd | tr -d "\n" | pbcopy'

