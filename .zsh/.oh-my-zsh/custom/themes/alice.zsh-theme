# alice.zsh-theme

# colors
local blue=$fg[blue]
local red_bold=$fg_bold[red]
local green=$fg[green]
local green_bold=$fg_bold[green]
local magenta=$fg[magenta]
local yellow=$fg[yellow]

# prompt substitutions
local git_prompt='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local smiley="%(?,%{$green%}:%)%{$reset_color%},%{$red_bold%}:(%{$reset_color%})"

# prompt variables (now in environment)
ZSH_THEME_GIT_PROMPT_PREFIX="%{$blue%}git:(%{$red_bold%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$blue%}) "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$blue%})%{$red_bold%} </>"
ZSH_THEME_GIT_PROMPT_ADDED="%{$green_bold%} ++"
ZSH_THEME_GIT_PROMPT_DELETED="%{$red_bold%} --"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$yellow%} 署"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$green_bold%} ***"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$red_bold%} !="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$yellow%} ?"

# prompt
setopt PROMPT_SUBST
precmd_prompt() {
    PROMPT="%{$magenta%}${PWD/#$HOME/~}%  ${git_prompt}%{$reset_color%}"
    PROMPT+=$'\n'
    PROMPT+="-> "

    RPROMPT="${smiley}"

    PROMPT2="-> "
}
precmd_functions+=(precmd_prompt)

