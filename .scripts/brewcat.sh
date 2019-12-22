#!/usr/bin/env zsh

function usage() {
  echo ''
  echo 'Usage: brewcat.sh'
  echo '  Shorthand for "brew cat <formulae> | bat -l ruby"'
  echo ''
  echo 'Example:'
  echo '  brewcat.sh python'
  echo ''
}

function check_brew() {
  local BREWNOTFOUND="brew command was not found"
  (( $+commands[brew] )) || { echo "${BREWNOTFOUND}"; exit 1; } 
}

function check_bat() {
  local BATNOTFOUND="bat command was not found"
  (( $+commands[bat] )) || { echo "${BATNOTFOUND}"; exit 1; }
}

function brew_cat() {
  /usr/local/bin/brew cat "$1" | /usr/local/bin/bat -l ruby
}

function main() {
  check_brew
  check_bat

  if [[ "$#" -eq 1 ]]; then
    brew_cat "$@"
  else
    usage
  fi
}

main "$@"

