## alice.zsh-theme

## colors
local blue=$fg[blue]
local blue_bold=$fg_bold[blue]
local red_bold=$fg_bold[red]
local green=$fg[green]
local green_bold=$fg_bold[green]
local magenta=$fg[magenta]
local yellow=$fg[yellow]
local white=$fg[white]


## prompt substitutions
local git_info='$(git_prompt_info)'
local smiley="%(?,%{$green%}:%)%{$reset_color%},%{$red_bold%}:(%{$reset_color%})"
local check="%{$green%}%{$reset_color%}"

## git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$blue_bold%}git:(%{$red_bold%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$blue%}) ${check}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$blue%})%{$red_bold%} 署"

## git status
#ZSH_THEME_GIT_PROMPT_ADDED="::%{$green_bold%}++"
#ZSH_THEME_GIT_PROMPT_DELETED="::%{$red_bold%}--"
#ZSH_THEME_GIT_PROMPT_MODIFIED="::%{$yellow%}</>"
#ZSH_THEME_GIT_PROMPT_RENAMED="::%{$green_bold%}***"
#ZSH_THEME_GIT_PROMPT_UNMERGED="::%{$red_bold%}!="
#ZSH_THEME_GIT_PROMPT_UNTRACKED="::%{$yellow%}?"

## prompt
setopt PROMPT_SUBST
precmd_prompt() {
    PROMPT="%{$magenta%}${PWD/#$HOME/~}%  ${git_info}%{$reset_color%}"
    PROMPT+=$'\n'
    PROMPT+="-> "

    RPROMPT="${smiley}"

    PROMPT2="%{$white%}-> "
}
precmd_functions+=(precmd_prompt)
