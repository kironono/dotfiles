# prompt {{{
autoload -Uz git-prompt

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

precmd () { git-prompt }

# prompt left
PROMPT='%{$fg[yellow]%}%n%{$fg[green]%}@%m%{${fg[blue]}%} %(4~,%-1~/.../%2~,%~)%{$reset_color%}'
PROMPT=$PROMPT'%{$fg[red]%}$(__git_ps1)'$'\n''%{${fg[magenta]}%}%}❯%{${reset_color}%} '
# }}}
