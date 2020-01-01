#!/usr/bin/env zsh

BL="$(echo -e "\e[1;94m")"
GR="$(echo -e "\e[1;92m")"
END="$(echo -e "\e[0m")"


if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM="$ZSH/custom"
    ZCPLUGINS="$ZSH_CUSTOM/plugins"
fi


for d in "${ZCPLUGINS}"/*; do
    if [[ -d "$d" ]]; then
        case "$d" in 
            "${ZCPLUGINS}/example")
                continue
                ;;
            *)
                cd "$d" || { echo "cd failed.. is $d a directory?"; }
                echo "${BL}Updating ${GR}${d##*/}...${END}"
                git pull --rebase 1> /dev/null
        esac

    elif [[ -f "$d" ]]; then
        echo "$d is a file!"

    fi
done;

