zmodload zsh/zprof

export TERM=xterm-256color
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export EDITOR=nvim


autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

#### // neofetch
#
if [[ "$OSTYPE" == "linux-gnu" ]]
then
    neofetch --ascii_distro kubuntu
else
    neofetch
fi

#### // oh my zsh
#
export ZSH="$HOME/.oh-my-zsh"
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    git
    zsh-history-substring-search
    zsh-autopair
)
source $ZSH/oh-my-zsh.sh

#### // highlighting customizations
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue,bold'
# // look at:
# // https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# // for more customization options


#### // zsh autosuggestions
#
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd


#### // prompt
#
setopt PROMPT_SUBST
precmd_prompt() {
    smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
    PROMPT='%{$fg_bold[magenta]%}${PWD/#$HOME/~}%  $(git_prompt_info)
%{$fg_bold[blue]%}-> '
    RPROMPT='${smiley}'
    ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[blue]git:($fg[red]"
    ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
    ZSH_THEME_GIT_PROMPT_DIRTY="$fg[blue]) $fg[yellow]署"
    ZSH_THEME_GIT_PROMPT_CLEAN="$fg[blue]) "
}
precmd_functions+=(precmd_prompt)


#### // OS specific stuff
#
if [[ "$OSTYPE" == "linux-gnu" ]]; then 
    # // z
    [[ -f "$HOME/z.sh" ]] \
        && . "$HOME/z.sh"
    # // brew
    [[ -d /home/linuxbrew/.linuxbrew/bin ]] \
        && export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

    [[ -d /snap/bin ]] \
        && export PATH="/snap/bin:$PATH"

elif [[ "$OSTYPE" =~ "darwin" ]]; then
    # // macports
    [[ -f /opt/local/bin/port ]] \
        && export PATH="/opt/local/bin:$PATH"
    # // z
    [[ -f /usr/local/etc/profile.d/z.sh ]] \
        && . /usr/local/etc/profile.d/z.sh
    # // poetry
    [[ -d "$HOME/.poetry/bin" ]] \
        && export PATH="$HOME/.poetry/bin:$PATH"
    #### // conda
    [[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]] \
        && . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi


#### // path
#
# // .local/bin

[[ -d "$HOME/.local/bin" ]] \
    && export PATH="$HOME/.local/bin:$PATH"
#
# // rbenv
[[ -d "$HOME/.rbenv/shims" ]] \
    && eval "$(rbenv init -)"
#
# // go
[[ -d "$HOME/go" ]] \
    && export GOPATH="$HOME/go" \
    && export PATH="${GOPATH//://bin:}/bin:$PATH"


#### // options, other
#
export PAGER=most
setopt extended_glob
disable r
export CLICOLOR=1
export LS_COLORS='di=1;4;34:fi=1;32:ln=1;35:pi=0:bd=0:cd=0:mi=1;4;31:ex=1;31'


#### // helper files
#
#export LESS="--RAW-CONTROL-CHARS"
#[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
[[ -f ~/.functions ]] && . ~/.functions
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh

