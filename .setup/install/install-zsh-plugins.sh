#!/usr/bin/env zsh

if [[ -z "$ZSH_CUSTOM" ]]; then
  ZSH_CUSTOM="$ZSH/custom"
  ZSH_CUSTOM_PLUGINS="$ZSH_CUSTOM/plugins"
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

PLUG_DIRS=(
  'zsh-syntax-highlighting'
  'zsh-completions'
  'zsh-history-substring-search'
  'zsh-autosuggestions'
  'forgit'
  'zsh-autopair'
)

function echo_plug_dir() {
	for plug_dir in $PLUG_DIRS; do
		echo  "$ZSH_CUSTOM_PLUGINS/$plug_dir"
	done
}

function echo_plug() {
	for plug in $PLUGS; do
  		echo "$GITHUB/$plug"
	done
}

#echo_plug_dir
#printf '\n\n'
#echo_plug

function make_plug_dirs() {
	for plug_dir in $PLUG_DIRS; do
		[[ -d "$ZSH_CUSTOM_PLUGINS/$plug_dir" ]] || mkdir -p "$ZSH_CUSTOM_PLUGINS/$plug_dir";
	done
}

function git_clone_plugs() {
	for plug in $PLUGS; do
		git clone $GITHUB/$plug $ZSH_CUSTOM_PLUGINS/$(echo $plug | sed 's/zsh\-users\|wfxr\|hlissner//g' | sed 's/\///g')
	done
}

make_plug_dirs
git_clone_plugs

