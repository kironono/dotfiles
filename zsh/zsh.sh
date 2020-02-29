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

# compinit
autoload -Uz compinit
compinit

# colors
autoload -Uz colors
colors

zstyle ':completion:*' menu select
setopt correct

# vcs_info
autoload -Uz vcs_info

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# alias
#
alias ls='ls -G'
alias ll='ls -alF'
alias pwdc='pwd | tr -d "\n" | pbcopy'

#
# prompt
#
# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト（左）
PROMPT='%{$fg[green]%}[%n%{$fg[blue]%}@%m]%{$reset_color%}'
PROMPT=$PROMPT' ${vcs_info_msg_0_}%{${fg[white]}%}%}$%{${reset_color}%} '

# プロンプト（右）
RPROMPT='%{${fg[blue]}%}[%~]%{${reset_color}%}'
