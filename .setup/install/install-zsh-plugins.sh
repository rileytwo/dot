#!/usr/bin/env zsh

if [[ -z "$ZSH_CUSTOM" ]]; then
  ZSH_CUSTOM="$ZSH/custom"
  ZCPLUGINS="$ZSH_CUSTOM/plugins"
fi

GITHUB="https://github.com/"

PLUGS=(
  'zsh-users/zsh-syntax-highlighting'
  'zsh-users/zsh-completions'
  'zsh-users/zsh-history-substring-search'
  'zsh-users/zsh-autosuggestions'
  'wfxr/forgit'
  'hlissner/zsh-autopair'
)

PLUG_DIR=(
  'zsh-syntax-highlighting'
  'zsh-completions'
  'zsh-history-substring-search'
  'zsh-autosuggestions'
  'forgit'
  'zsh-autopair'
)

for plug_dir in $PLUG_DIRS; do
  mkdir -p "$ZCPLUGINS/$plug_dir"
done

for plug in $PLUGS; do
  git clone "$GITHUB/$plug" "$ZCPLUGINS/"
done
