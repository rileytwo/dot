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
# // prompt comes first?
#
ZSH_THEME='alice'

export ZSH="${HOME}/.oh-my-zsh"
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    git
    virtualenv
    zsh-history-substring-search
    zsh-autopair
    k
    autoupdate
)
source $ZSH/oh-my-zsh.sh

#### // highlighting customizations
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=magenta'

ZSH_HIGHLIGHT_STYLES[path]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=red,bold'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'

ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
# // look at:
# // https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# // for more customization options


#### // zsh autosuggestions
#
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd


#### // OS specific stuff
#
if [[ "$OSTYPE" == "linux-gnu" ]]; then 
    # // z
    [[ -f "${HOME}/z.sh" ]] \
        && . "${HOME}/z.sh"
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
fi


#### // path
#
# // ~/bin
[[ -d "${HOME}/bin" ]] \
    && export PATH="$HOME/bin:$PATH"
#
# // ~/.local/bin
[[ -d "${HOME}/.local/bin" ]] \
    && export PATH="$HOME/.local/bin:$PATH"
#
# // ~/.rbenv
[[ -d "${HOME}/.rbenv/shims" ]] \
    && eval "$(rbenv init -)"
#
# // ~/go
[[ -d "${HOME}/go" ]] \
    && export GOPATH="${HOME}/go" \
    && export PATH="${GOPATH//://bin:}/bin:$PATH"
#
# // ~/.pyenv
if (( $+commands[pyenv] )) && (( $+commands[pyenv-virtualenv-init])); then 
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
elif (( $+commands[pyenv] )); then
    eval "$(pyenv init -)"
fi


#### // options, other
#
export PAGER=most
setopt EXTENDED_GLOB
setopt GLOB_DOTS
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

[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] \
    && source "${HOME}/.iterm2_shell_integration.zsh"


zstyle ':completion:*' completer _complete _match _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

