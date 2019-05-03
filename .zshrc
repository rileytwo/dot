zmodload zsh/zprof

archey -o
eval $(thefuck --alias)

# <:::: oh my zsh ::::>
export ZSH="/Users/riley/.oh-my-zsh"

plugins=(zsh-syntax-highlighting zsh-autosuggestions git)

source $ZSH/oh-my-zsh.sh
# <:::: end oh my zsh ::::>
# <:::: zsh autosuggestions ::::>
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# <:::: prompt ::::>
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
PROMPT='
%{$fg_bold[magenta]%}${PWD/#$HOME/~}%  $(git_prompt_info)
%{$fg_bold[blue]%}-> '
RPROMPT='${smiley}'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[blue]git:($fg[red]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[blue]) $fg[yellow]✗"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[blue])"
# <:::: end prompt ::::>

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '~/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "~/miniconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="~/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<

#conda activate base
. ~/miniconda3/etc/profile.d/conda.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -f ~/.functions ]] && . ~/.functions
[[ -f ~/.aliases ]] && . ~/.aliases