#
# vim: shiftwidth=2
#


# zsh modules
zmodload zsh/zprof
autoload zmv
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey '^xe' edit-command-line


#### // neofetch
# color order:
#   'title' '@' 'underline'
#   'subtitle' 'colon' 'info'
#
if [[ "${TERM_PROGRAM}" =~ "vscod" ]]; then
  :
else 
  if [[ "${OSTYPE}" =~ "darwin" ]]; then
    neofetch \
      --ascii "${HOME}"/.dot/.config/neofetch/config-mac.conf \
      --colors 5 7 7 4 7 15
  elif [[ "${OSTYPE}" == "linux-gnu" ]]; then
    neofetch \
      --config "${HOME}"/.config/neofetch/config-linux.conf \
      --ascii_distro kubuntu \
      --colors 5 7 7 4 7 15
  fi
fi


#### // oh my zsh

DISABLE_AUTO_UPDATE=true
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${HOME}/.zsh_history"
ZSH_THEME='kiss'
export ZSH="${HOME}/.oh-my-zsh"
plugins=(
  swiftpm
  #zsh-interactive-cd
  git
  forgit
  zsh-autopair
  zsh-completions
  zsh-history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)
fpath=(${ZSH}/custom/plugins/zsh-completions/src ${fpath})
source "${ZSH}/oh-my-zsh.sh"



#### // environment

export CLICOLOR=1
export LS_COLORS='di=1;4;34:fi=1;32:ln=1;35:pi=0:bd=0:cd=0:mi=1;4;31:ex=1;31'
export TERM=xterm-256color
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
disable r

if (( $+commands[most] )); then
  export PAGER=most
fi

if (( $+commands[nvim] )); then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

if [[ ${LC_TERMINAL} =~ "i[tT]erm2" ]]; then
  export MPLBACKEND="module://itermplot"
  export ITERMPLOT=rv
fi

[[ -e "${HOME}/.iterm2_shell_integration.zsh" ]] \
  && source "${HOME}/.iterm2_shell_integration.zsh" || :



#### // completions

autoload -Uz compinit
setopt EXTENDEDGLOB
for dump in ${HOME}/.zcompdump(#qN.m1); do
  compinit
  if [[ -s "${dump}" && (! -s "${dump}.zwc" || \
    "${dump}" -nt "${dump}.zwc") ]]; \
  then
    zcompile "${dump}"
  fi
done
unsetopt EXTENDEDGLOB
compinit -C



#### // zstyle

fignore=(DS_Store ${fignore})

# NOTE as follows `:completion:function:completer:command:argument:tag`
zstyle ':completion:*' completer \
  _complete _match _approximate _ignored

zstyle ':completion:*' accept-exact false
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${HOME}/.zsh/cache"
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' menu select=2
zstyle ':completion:*' special-dirs false
zstyle ':completion:*:descriptions' format \
  "$fg[yellow]%B--- %d%b"

zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format \
  "$fg[red]No matches for:$reset_color %d"

zstyle ':completion:*:corrections' format \
  '%B%d (errors: %e)%b'

zstyle ':completion:*' list-colors \
  "${(s.:.)LS_COLORS}"
# NOTE `(s.:.)` forces field splitting at the separator *string*

zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose true



#### // highlighting

ZSH_HIGHLIGHT_HIGHLIGHTERS=(
  main
  brackets
  #pattern
  root
)

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=green'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=green'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'

ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='f=magenta'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=magenta'

ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=magenta'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yellow,bold'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=green'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=green'

# // look at:
# // zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# // for more customization options



#### // zsh autosuggestions

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
  # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)



#### // OS specific stuff

if [[ "${OSTYPE}" =~ "linux-gnu" ]]; then

  umask 002

  [[ -f "${HOME}/z.sh" ]] \
    && source "${HOME}/z.sh"

  [[ -d "/snap/bin" ]] \
    && export PATH="/snap/bin:$PATH"

  [[ -d "${HOME}/.npm-global" ]] \
    && export PATH="${HOME}/.npm-global/bin:$PATH"

  [[ -d "/usr/share/swift" ]] \
    && export PATH="/usr/share/swift/usr/bin:$PATH"

  [[ -d "/home/linuxbrew/.linuxbrew/bin" ]] \
    && export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

elif [[ "${OSTYPE}" =~ "darwin" ]]; then

  [[ -f /opt/local/bin/port ]] \
    && export PATH="/opt/local/bin:$PATH"

  [[ -f /usr/local/etc/profile.d/z.sh ]] \
    && source /usr/local/etc/profile.d/z.sh

fi



#### // path

[[ -d "${HOME}/bin" ]] \
  && export PATH="$HOME/bin:$PATH"

[[ -d "${HOME}/.local/bin" ]] \
  && export PATH="$HOME/.local/bin:$PATH"

[[ -d "${HOME}/go" ]] \
  && export GOPATH="${HOME}/go" \
  && export PATH="${GOPATH//://bin:}/bin:$PATH"

[[ -d "${HOME}/.cargo" ]] \
  && export PATH="${HOME}/.cargo/bin:$PATH"

[[ -d "${HOME}/.pyenv" ]] \
  && export PATH="${HOME}/.pyenv/bin:$PATH"

if (( $+commands[pyenv] )) && (( $+commands[pyenv-virtualenv-init])); then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
fi

if (( $+commands[rbenv] )); then
  eval "$(rbenv init -)"
fi

if (( $+commands[fzf] )); then
  if [[ -f "${HOME}"/.fzf.zsh ]]; then
    source "${HOME}"/.fzf.zsh
  elif [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
  fi
fi

if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi
export FZF_DEFAULT_OPTS='
--color=fg:#c4c4c4,bg:#121212,hl:#2d7eb7
--color=fg+:#e6e6e6,bg+:#262626,hl+:#3fb2ff
--color=info:#d4ce90,prompt:#9691ff,pointer:#ff7e81
--color=marker:#73ff96,spinner:#ff7e81,header:#54cc72'



#### // helpers

[[ -f /usr/local/bin/typex ]] && source /usr/local/bin/typex

[[ -f "${HOME}/.aliases" ]] && source "${HOME}/.aliases"

