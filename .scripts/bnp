#!/usr/bin/env zsh

local inst=$(brew search | eval "fzf -m --header='[brew:info]'")

if [[ $inst ]]; then
  for prog in $(echo $inst)
  do brew info $prog
  done
fi
