zmodload zsh/zprof

archey -o
eval $(thefuck --alias)

# <:::: oh my zsh ::::>
export ZSH="/Users/riley/.oh-my-zsh"

plugins=(zsh-syntax-highlighting zsh-autosuggestions git)

source $ZSH/oh-my-zsh.sh
# <:::: end oh my zsh ::::>
# <:::: zsh autosuggestions ::::>
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# <:::: prompt ::::>
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
PROMPT='
%{$fg_bold[magenta]%}${PWD/#$HOME/~}%  $(git_prompt_info)
%{$fg_bold[blue]%}-> '
RPROMPT='${smiley}'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[blue]git:($fg[red]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[blue]) $fg[yellow]✗"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[blue])"
# <:::: end prompt ::::>

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '~/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "~/miniconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="~/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<

. ~/miniconda3/etc/profile.d/conda.sh
#conda activate base

alias r="conda activate && radian"

alias gh='~/Documents/Projects/Github'

alias dot='~/.dot'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
alias lc='colorls'



# ZSH / BASH users
# Add this to your .env, .bashrc, .zshrc, or whatever file you're using for environment

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

export LESS="--RAW-CONTROL-CHARS"

[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

oo-ifconfig () {
    ip addr | sed -r ':a;N;$!ba;s/\n\s/ /g' \
        | sed -r -n -e 's/^([0-9]+):\s(\w+).*(link\/(\w+))\s[a-f0-9:.]{,17}\sbrd\s[a-f0-9:.]{,17}\s*(inet\s([0-9]{1,3}(\.[0-9]{1,3}){3})).*/- \2 \x1b[1;32m \6 \x1b[0m \4/p' -e 's/^([0-9]+):\s(\w+).*(link\/(\w+))\s[a-f0-9:.]{,17}\sbrd\s[a-f0-9:.]{,17}.*/- \2 \x1b[1m 0.0.0.0 \x1b[0m \4/p'
}


# | Print all colors in console
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

oo-colors () {

    echo "# Reset color"
    echo -e "\e[0m ***** AaBbCs *** \[\\\e[0m\] *** \\\e[0m \\e[0m ---> rs"

    echo ""
    echo "# Regularcolors"

    #black
    echo -e "\e[0;30m ***** AaBbCs *** \[\\\e[0;30m\] *** \\\e[0;30m \\e[0m ---> black"
    #red
    echo -e "\e[0;31m ***** AaBbCs *** \[\\\e[0;31m\] *** \\\e[0;31m \\e[0m ---> red"
    #green
    echo -e "\e[0;32m ***** AaBbCs *** \[\\\e[0;32m\] *** \\\e[0;32m \\e[0m ---> green"
    #yellow
    echo -e "\e[0;33m ***** AaBbCs *** \[\\\e[0;33m\] *** \\\e[0;33m \\e[0m ---> yellow"
    #blue
    echo -e "\e[0;34m ***** AaBbCs *** \[\\\e[0;34m\] *** \\\e[0;34m \\e[0m ---> blue"
    #purple
    echo -e "\e[0;35m ***** AaBbCs *** \[\\\e[0;35m\] *** \\\e[0;35m \\e[0m ---> purple"
    #cyan
    echo -e "\e[0;36m ***** AaBbCs *** \[\\\e[0;36m\] *** \\\e[0;36m \\e[0m ---> cyan"
    #white
    echo -e "\e[0;37m ***** AaBbCs *** \[\\\e[0;37m\] *** \\\e[0;37m \\e[0m ---> white"

    echo ""
    echo "# Bold"

    #black
    echo -e "\e[1;30m ***** AaBbCs *** \[\\\e[1;30m\] *** \\\e[1;30m \\e[0m ---> bblack"
    #red
    echo -e "\e[1;31m ***** AaBbCs *** \[\\\e[1;31m\] *** \\\e[1;31m \\e[0m ---> bred"
    #green
    echo -e "\e[1;32m ***** AaBbCs *** \[\\\e[1;32m\] *** \\\e[1;32m \\e[0m ---> bgreen"
    #yellow
    echo -e "\e[1;33m ***** AaBbCs *** \[\\\e[1;33m\] *** \\\e[1;33m \\e[0m ---> byellow"
    #blue
    echo -e "\e[1;34m ***** AaBbCs *** \[\\\e[1;34m\] *** \\\e[1;34m \\e[0m ---> bblue"
    #purple
    echo -e "\e[1;35m ***** AaBbCs *** \[\\\e[1;35m\] *** \\\e[1;35m \\e[0m ---> bpurple"
    #cyan
    echo -e "\e[1;36m ***** AaBbCs *** \[\\\e[1;36m\] *** \\\e[1;36m \\e[0m ---> bcyan"
    #white
    echo -e "\e[1;37m ***** AaBbCs *** \[\\\e[1;37m\] *** \\\e[1;37m \\e[0m ---> bwhite"

    echo ""
    echo "# Underline"

    #black
    echo -e "\e[4;30m ***** AaBbCs *** \[\\\e[4;30m\] *** \\\e[4;30m \\e[0m ---> ublack"
    #red
    echo -e "\e[4;31m ***** AaBbCs *** \[\\\e[4;31m\] *** \\\e[4;31m \\e[0m ---> ured"
    #green
    echo -e "\e[4;32m ***** AaBbCs *** \[\\\e[4;32m\] *** \\\e[4;32m \\e[0m ---> ugreen"
    #yellow
    echo -e "\e[4;33m ***** AaBbCs *** \[\\\e[4;33m\] *** \\\e[4;33m \\e[0m ---> uyellow"
    #blue
    echo -e "\e[4;34m ***** AaBbCs *** \[\\\e[4;34m\] *** \\\e[4;34m \\e[0m ---> ublue"
    #purple
    echo -e "\e[4;35m ***** AaBbCs *** \[\\\e[4;35m\] *** \\\e[4;35m \\e[0m ---> upurple"
    #cyan
    echo -e "\e[4;36m ***** AaBbCs *** \[\\\e[4;36m\] *** \\\e[4;36m \\e[0m ---> ucyan"
    #white
    echo -e "\e[4;37m ***** AaBbCs *** \[\\\e[4;37m\] *** \\\e[4;37m \\e[0m ---> uwhite"

    echo ""
    echo "# Background"

    #black
    echo -e "\e[40m ***** AaBbCs *** \[\\\e[40m\] *** \\\e[40m \\e[0m ---> on_black"
    #red
    echo -e "\e[41m ***** AaBbCs *** \[\\\e[41m\] *** \\\e[41m \\e[0m ---> on_red"
    #green
    echo -e "\e[42m ***** AaBbCs *** \[\\\e[42m\] *** \\\e[42m \\e[0m ---> on_green"
    #yellow
    echo -e "\e[43m ***** AaBbCs *** \[\\\e[43m\] *** \\\e[43m \\e[0m ---> on_yellow"
    #blue
    echo -e "\e[44m ***** AaBbCs *** \[\\\e[44m\] *** \\\e[44m \\e[0m ---> on_blue"
    #purple
    echo -e "\e[45m ***** AaBbCs *** \[\\\e[45m\] *** \\\e[45m \\e[0m ---> on_purple"
    #cyan
    echo -e "\e[46m ***** AaBbCs *** \[\\\e[46m\] *** \\\e[46m \\e[0m ---> on_cyan"
    #white
    echo -e "\e[47m ***** AaBbCs *** \[\\\e[47m\] *** \\\e[47m \\e[0m ---> on_white"

    echo ""
    echo "# Highintensity"

    #black
    echo -e "\e[0;90m ***** AaBbCs *** \[\\\e[0;90m\] *** \\\e[0;90m \\e[0m ---> iblack"
    #red
    echo -e "\e[0;91m ***** AaBbCs *** \[\\\e[0;91m\] *** \\\e[0;91m \\e[0m ---> ired"
    #green
    echo -e "\e[0;92m ***** AaBbCs *** \[\\\e[0;92m\] *** \\\e[0;92m \\e[0m ---> igreen"
    #yellow
    echo -e "\e[0;93m ***** AaBbCs *** \[\\\e[0;93m\] *** \\\e[0;93m \\e[0m ---> iyellow"
    #blue
    echo -e "\e[0;94m ***** AaBbCs *** \[\\\e[0;94m\] *** \\\e[0;94m \\e[0m ---> iblue"
    #purple
    echo -e "\e[0;95m ***** AaBbCs *** \[\\\e[0;95m\] *** \\\e[0;95m \\e[0m ---> ipurple"
    #cyan
    echo -e "\e[0;96m ***** AaBbCs *** \[\\\e[0;96m\] *** \\\e[0;96m \\e[0m ---> icyan"
    #white
    echo -e "\e[0;97m ***** AaBbCs *** \[\\\e[0;97m\] *** \\\e[0;97m \\e[0m ---> iwhite"

    echo ""
    echo "# Boldhighintensity"

    #black
    echo -e "\e[1;90m ***** AaBbCs *** \[\\\e[1;90m\] *** \\\e[1;90m \\e[0m ---> biblack"
    #red
    echo -e "\e[1;91m ***** AaBbCs *** \[\\\e[1;91m\] *** \\\e[1;91m \\e[0m ---> bired"
    #green
    echo -e "\e[1;92m ***** AaBbCs *** \[\\\e[1;92m\] *** \\\e[1;92m \\e[0m ---> bigreen"
    #yellow
    echo -e "\e[1;93m ***** AaBbCs *** \[\\\e[1;93m\] *** \\\e[1;93m \\e[0m ---> biyellow"
    #blue
    echo -e "\e[1;94m ***** AaBbCs *** \[\\\e[1;94m\] *** \\\e[1;94m \\e[0m ---> biblue"
    #purple
    echo -e "\e[1;95m ***** AaBbCs *** \[\\\e[1;95m\] *** \\\e[1;95m \\e[0m ---> bipurple"
    #cyan
    echo -e "\e[1;96m ***** AaBbCs *** \[\\\e[1;96m\] *** \\\e[1;96m \\e[0m ---> bicyan"
    #white
    echo -e "\e[1;97m ***** AaBbCs *** \[\\\e[1;97m\] *** \\\e[1;97m \\e[0m ---> biwhite"

    echo ""
    echo "# Highintensitybackgrounds"

    #black
    echo -e "\e[0;100m ***** AaBbCs *** \[\\\e[0;100m\] *** \\\e[0;100m \\e[0m ---> on_iblack"
    #red
    echo -e "\e[0;101m ***** AaBbCs *** \[\\\e[0;101m\] *** \\\e[0;101m \\e[0m ---> on_ired"
    #green
    echo -e "\e[0;102m ***** AaBbCs *** \[\\\e[0;102m\] *** \\\e[0;102m \\e[0m ---> on_igreen"
    #yellow
    echo -e "\e[0;103m ***** AaBbCs *** \[\\\e[0;103m\] *** \\\e[0;103m \\e[0m ---> on_iyellow"
    #blue
    echo -e "\e[0;104m ***** AaBbCs *** \[\\\e[0;104m\] *** \\\e[0;104m \\e[0m ---> on_iblue"
    #purple
    echo -e "\e[0;105m ***** AaBbCs *** \[\\\e[0;105m\] *** \\\e[0;105m \\e[0m ---> on_ipurple"
    #cyan
    echo -e "\e[0;106m ***** AaBbCs *** \[\\\e[0;106m\] *** \\\e[0;106m \\e[0m ---> on_icyan"
    #white
    echo -e "\e[0;107m ***** AaBbCs *** \[\\\e[0;107m\] *** \\\e[0;107m \\e[0m ---> on_iwhite"

}

color () {
    # echo ""
    #black
    echo -e "\e[0;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 01 0;30m"
    #red
    echo -e "\e[0;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 02 0;31m"
    #green
    echo -e "\e[0;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 03 0;32m"
    #yellow
    echo -e "\e[0;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 04 0;33m"
    #blue
    echo -e "\e[0;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 05 0;34m"
    #purple
    echo -e "\e[0;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 06 0;35m"
    #cyan
    echo -e "\e[0;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 07 0;36m"
    #white
    echo -e "\e[0;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 08 0;37m"
    echo ""
    #black
    echo -e "\e[1;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 09 1;30m"
    #red
    echo -e "\e[1;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 10 1;31m"
    #green
    echo -e "\e[1;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 11 1;32m"
    #yellow
    echo -e "\e[1;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 12 1;33m"
    #blue
    echo -e "\e[1;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 13 1;34m"
    #purple
    echo -e "\e[1;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 14 1;35m"
    #cyan
    echo -e "\e[1;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 15 1;36m"
    #white
    echo -e "\e[1;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 16 1;37m"
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
}
