#!/usr/bin/env zsh

function xmanpage() {
  open x-man-page://"$@";
}

function preman() {
  man -t "$@" | open -f -a "Preview";
}

function domains() {
  echo -e "${"$(defaults domains)"//, /\\n}"
}


if (( $+aliases[gl] )); then
  unalias gl     
fi

function gl() {
  git log --oneline -n "$@" 2>/dev/null || git log --oneline -n 5
}

