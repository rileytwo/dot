#!/usr/bin/env zsh

nq="--no-quarantine"

if (( $+commands[brew] )); then
  brew="brew"
fi

if [ "$1" ]; then
  "$brew" cask install "$1" "$nq"
fi
