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

zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # for git prior to 1.7
    # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    (( $ahead )) && gitstatus+=( "+${ahead}" )

    # for git prior to 1.7
    # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "-${behind}" )

    hook_com[misc]+=${(j:/:)gitstatus}
}


precmd () { vcs_info }

# prompt left
PROMPT='%{$fg[yellow]%}[%n%{$fg[green]%}@%m%{${fg[blue]}%}:%(4~,%-1~/.../%2~,%~)]%{$reset_color%}'
PROMPT=$PROMPT' ${vcs_info_msg_0_}%{${fg[white]}%}%}%#%{${reset_color}%} '
# prompt right
RPROMPT='%{${fg[blue]}%}[%~]%{${reset_color}%}'
# }}}
