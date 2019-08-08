#!/usr/bin/env bash

BL="$(echo -e "\e[94m")"
END="$(echo -e "\e[0m")"


if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH/custom"
    ZSH_CUSTOM_PLUGS="$ZSH_CUSTOM/plugins"
fi


for d in "${ZSH_CUSTOM_PLUGS}"/*;
    do
        [ -d "$d" ] && cd "$d"; echo "${BL}Updating $d${END}"; git pull --rebase
done;
