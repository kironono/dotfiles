
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt HIST_IGNORE_DUPS

# 開始と終了を記録
setopt EXTENDED_HISTORY


# compinit
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

setopt correct

# colors
autoload -Uz colors
colors

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# alias
alias ls='ls -G'
alias ll='ls -alF'

alias pwdc='pwd | tr -d "\n" | pbcopy'
