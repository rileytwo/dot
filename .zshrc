zmodload zsh/zprof

export TERM=xterm-256color
export HOMEBREW_NO_AUTO_UPDATE=1

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# archey -o -p
neofetch
eval "$(thefuck --alias)"



#### // oh my zsh
export ZSH="/Users/riley/.oh-my-zsh"

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    git
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh
#### // end oh my zsh



#### // highlighting customizations
typeset -A ZSH_HIGHLIGHT_STYLES

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue,bold'

## look at https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md for more customization options
#### // end highlighting customizations




#### // zsh autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd




#### // prompt
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
PROMPT='
%{$fg_bold[magenta]%}${PWD/#$HOME/~}%  $(git_prompt_info)
%{$fg_bold[blue]%}-> '
RPROMPT='${smiley}'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[blue]git:($fg[red]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[blue]) $fg[yellow]✗"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[blue]) ✓"
#### // end prompt



. ~/miniconda3/etc/profile.d/conda.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export CLICOLOR=1
export LS_COLORS='di=1;4;34:fi=1;32:ln=1;35:pi=0:bd=0:cd=0:mi=1;4;31:ex=1;31'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


#### // helper files
[[ -f ~/.functions ]] && . ~/.functions
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -d ~/usr ]] && export PATH=~/usr:$PATH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#### // end helper files



#### // options
setopt extended_glob

