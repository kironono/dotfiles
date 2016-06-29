PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '

if [ -f $HOME/.dotfiles/bash/git-completion.bash ]; then
    source $HOME/.dotfiles/bash/git-completion.bash
fi
if [ -f $HOME/.dotfiles/bash/git-prompt.sh ]; then
    source $HOME/.dotfiles/bash/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
