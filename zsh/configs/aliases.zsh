
# list {{{
if $(cmd-exist exa); then
	alias ls='exa'
	alias ll='ls -lagh'
	alias la='ls -lagh --git'
else
	alias ls='ls -G'
	alias ll='ls -ltr'
	alias la="ls -lhAF"
fi

alias pd="pushd"
alias po="popd"
# }}}

# paste {{{
alias pwdc='pwd | tr -d "\n" | pbcopy'
# }}}

# network {{{
alias gip='curl httpbin.org/ip'
# }}}

if $(cmd-exist bat); then
	alias cat='bat'
fi

