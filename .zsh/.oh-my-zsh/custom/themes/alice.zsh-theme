# alice.zsh-theme

setopt PROMPT_SUBST
precmd_prompt() {
    smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
    PROMPT='%{$fg[magenta]%}${PWD/#$HOME/~}%  $(git_prompt_info)'
    PROMPT+=$'\n'
    PROMPT+='%{$fg[blue]%}-> '
    ZSH_THEME_GIT_PROMPT_PREFIX="$fg[blue]git:($fg[red]"
    ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
    ZSH_THEME_GIT_PROMPT_DIRTY="$fg[blue]) $fg[yellow]署"
    ZSH_THEME_GIT_PROMPT_CLEAN="$fg[blue]) "
    
    RPROMPT='${smiley}'

    PROMPT2='-> '
}
precmd_functions+=(precmd_prompt)
