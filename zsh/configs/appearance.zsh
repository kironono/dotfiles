# colors {{{
autoload -Uz colors
colors

setopt prompt_subst

# export LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS=exfxfeaeBxxehehbadacea

# directory color
zstyle ':completion:*' list-colors 'di=36;49'
# }}}
