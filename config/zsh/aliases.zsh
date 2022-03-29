#!/usr/bin/env zsh
#
# aliases.zsh
#

# Aliases that work (for the most part) out of the box

## echo each path/fpath entry on newline
# `print -rl -- "${(@s/:/)PATH}"` also works
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'



# Aliases that require additional tools go here

if (( $+commands[git] )); then
    alias gs='git status'
    alias gcu='git checkout upstream'
    alias gng='git config --global'
    alias gngl='git config --global --list'
    alias gnl='git config --local'
    alias gnll='git config --local --list'
    alias gcd='git checkout dev'
    alias gcm='git checkout main'
fi


if (( $+commands[exa] )); then
    alias e='exa -lah'
    alias ee='exa -lhH'
    alias et='exa -lahT'
    alias eg='exa -lah --git'
fi


if (( $+commands[trash] )); then
    alias rm='trash'
fi


if (( $+commands[bat] || $+commands[batcat] )); then
    alias cat='bat'
fi


if (( $+commands[foaas-cli] )); then
    alias f='foaas-cli'
fi


if (( $+commands[karabiner_cli] )); then
    alias kb='karabiner_cli'
fi


if (( $+commands[pyenv] )); then
    alias p='pyenv'
    alias pv='pyenv version'
    alias pvs='pyenv versions'
fi


if (( $+commands[conda] )); then
    alias c='conda'
    alias cv='conda env list'
fi


if (( $+commands[R] )); then
    alias r='r --no-save'
fi


if (( $+commands[radian] )); then
    alias rr="radian"
fi


if (( $+commands[ddcctl] )); then
    alias ddc='ddcctl'
fi

if [[ -x "/usr/libexec/remotectl" ]]; then
    alias remotectl='/usr/libexec/remotectl'
fi


if [[ -x "/usr/libexec/PlistBuddy" ]]; then
    ## plistbuddy alias
    alias plistbuddy='/usr/libexec/PlistBuddy'
fi



