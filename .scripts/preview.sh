#!/usr/bin/env zsh

function usage() {
  echo ''
  echo 'preview.sh'
  echo '  Performs a recursive search of the current directory'
  echo '  using fzf and previews the file with bat'
  echo ''
  echo '  (-h | --help)  Print this message and exit'
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
  elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
    usage
  else
    usage
  fi
}

main "$@"

