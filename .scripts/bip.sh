#!/usr/bin/env zsh

### BREW + FZF
# install multiple packages at once
# mnemonic [B]rew [I]nstall [P]lugin

local inst=$(brew search | eval "fzf -m --header='[brew:install]'")

if [[ $inst ]]; then
  for prog in $(echo $inst)
  do brew install $prog
  done
fi