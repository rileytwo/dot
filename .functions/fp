#!/usr/bin/env zsh

### PATH
# mnemonic: [F]ind [P]ath
# list directories in $PATH, press [enter] on an entry to list the executables inside.
# press [escape] to go back to directory listing, [escape] twice to exit completely

local loc=$(echo $PATH | sed -e $'s/:/\\\n/g' | eval "fzf --header='[find:path]'")

if [[ -d $loc ]]; then
  echo "$(rg --files $loc | rev | cut -d"/" -f1 | rev)" | eval "fzf --header='[find:exe] => ${loc}' >/dev/null"
  fp
fi
