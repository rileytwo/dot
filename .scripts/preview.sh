#!/usr/bin/env zsh

function usage() {
  echo ''
  echo 'preview.sh'
  echo '  Performs a recursive search of the current directory'
  echo '  using fzf and preview the file with bat'
  echo ''
}

function check_fzf() {
  (( $+commands[fzf] )) || { echo "fzf not found"; exit 1; }
}

function check_bat() {
  (( $+commands[bat] )) || { echo "bat not found"; exit 1; }
}

function preview() {
    fzf --preview 'bat --color=always {}'
}

function main() {
  check_fzf
  check_bat
  if [[ "$#" -eq 0 ]]; then
    preview "$@"
  else
    usage
  fi
}

main "$@"

