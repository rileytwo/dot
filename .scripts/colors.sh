#!/usr/bin/env bash

# | Print all colors in console
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

colors() {
  echo "# Reset color"
  echo -e "\e[0m ***** AaBbCs *** \[\\\e[0m\] *** \\\e[0m \\e[0m ---> rs"
  echo ""
  echo "# Regularcolors"
  echo -e "\e[0;30m ***** AaBbCs *** \[\\\e[0;30m\] *** \\\e[0;30m \\e[0m ---> black"
  echo -e "\e[0;31m ***** AaBbCs *** \[\\\e[0;31m\] *** \\\e[0;31m \\e[0m ---> red"
  echo -e "\e[0;32m ***** AaBbCs *** \[\\\e[0;32m\] *** \\\e[0;32m \\e[0m ---> green"
  echo -e "\e[0;33m ***** AaBbCs *** \[\\\e[0;33m\] *** \\\e[0;33m \\e[0m ---> yellow"
  echo -e "\e[0;34m ***** AaBbCs *** \[\\\e[0;34m\] *** \\\e[0;34m \\e[0m ---> blue"
  echo -e "\e[0;35m ***** AaBbCs *** \[\\\e[0;35m\] *** \\\e[0;35m \\e[0m ---> purple"
  echo -e "\e[0;36m ***** AaBbCs *** \[\\\e[0;36m\] *** \\\e[0;36m \\e[0m ---> cyan"
  echo -e "\e[0;37m ***** AaBbCs *** \[\\\e[0;37m\] *** \\\e[0;37m \\e[0m ---> white"

  echo ""
  echo "# Bold"

  echo -e "\e[1;30m ***** AaBbCs *** \[\\\e[1;30m\] *** \\\e[1;30m \\e[0m ---> bblack"
  echo -e "\e[1;31m ***** AaBbCs *** \[\\\e[1;31m\] *** \\\e[1;31m \\e[0m ---> bred"
  echo -e "\e[1;32m ***** AaBbCs *** \[\\\e[1;32m\] *** \\\e[1;32m \\e[0m ---> bgreen"
  echo -e "\e[1;33m ***** AaBbCs *** \[\\\e[1;33m\] *** \\\e[1;33m \\e[0m ---> byellow"
  echo -e "\e[1;34m ***** AaBbCs *** \[\\\e[1;34m\] *** \\\e[1;34m \\e[0m ---> bblue"
  echo -e "\e[1;35m ***** AaBbCs *** \[\\\e[1;35m\] *** \\\e[1;35m \\e[0m ---> bpurple"
  echo -e "\e[1;36m ***** AaBbCs *** \[\\\e[1;36m\] *** \\\e[1;36m \\e[0m ---> bcyan"
  echo -e "\e[1;37m ***** AaBbCs *** \[\\\e[1;37m\] *** \\\e[1;37m \\e[0m ---> bwhite"

  echo ""
  echo "# Underline"

  echo -e "\e[4;30m ***** AaBbCs *** \[\\\e[4;30m\] *** \\\e[4;30m \\e[0m ---> ublack"
  echo -e "\e[4;31m ***** AaBbCs *** \[\\\e[4;31m\] *** \\\e[4;31m \\e[0m ---> ured"
  echo -e "\e[4;32m ***** AaBbCs *** \[\\\e[4;32m\] *** \\\e[4;32m \\e[0m ---> ugreen"
  echo -e "\e[4;33m ***** AaBbCs *** \[\\\e[4;33m\] *** \\\e[4;33m \\e[0m ---> uyellow"
  echo -e "\e[4;34m ***** AaBbCs *** \[\\\e[4;34m\] *** \\\e[4;34m \\e[0m ---> ublue"
  echo -e "\e[4;35m ***** AaBbCs *** \[\\\e[4;35m\] *** \\\e[4;35m \\e[0m ---> upurple"
  echo -e "\e[4;36m ***** AaBbCs *** \[\\\e[4;36m\] *** \\\e[4;36m \\e[0m ---> ucyan"
  echo -e "\e[4;37m ***** AaBbCs *** \[\\\e[4;37m\] *** \\\e[4;37m \\e[0m ---> uwhite"

  echo ""
  echo "# Background"

  echo -e "\e[40m ***** AaBbCs *** \[\\\e[40m\] *** \\\e[40m \\e[0m ---> on_black"
  echo -e "\e[41m ***** AaBbCs *** \[\\\e[41m\] *** \\\e[41m \\e[0m ---> on_red"
  echo -e "\e[42m ***** AaBbCs *** \[\\\e[42m\] *** \\\e[42m \\e[0m ---> on_green"
  echo -e "\e[43m ***** AaBbCs *** \[\\\e[43m\] *** \\\e[43m \\e[0m ---> on_yellow"
  echo -e "\e[44m ***** AaBbCs *** \[\\\e[44m\] *** \\\e[44m \\e[0m ---> on_blue"
  echo -e "\e[45m ***** AaBbCs *** \[\\\e[45m\] *** \\\e[45m \\e[0m ---> on_purple"
  echo -e "\e[46m ***** AaBbCs *** \[\\\e[46m\] *** \\\e[46m \\e[0m ---> on_cyan"
  echo -e "\e[47m ***** AaBbCs *** \[\\\e[47m\] *** \\\e[47m \\e[0m ---> on_white"

  echo ""
  echo "# Highintensity"

  echo -e "\e[0;90m ***** AaBbCs *** \[\\\e[0;90m\] *** \\\e[0;90m \\e[0m ---> iblack"
  echo -e "\e[0;91m ***** AaBbCs *** \[\\\e[0;91m\] *** \\\e[0;91m \\e[0m ---> ired"
  echo -e "\e[0;92m ***** AaBbCs *** \[\\\e[0;92m\] *** \\\e[0;92m \\e[0m ---> igreen"
  echo -e "\e[0;93m ***** AaBbCs *** \[\\\e[0;93m\] *** \\\e[0;93m \\e[0m ---> iyellow"
  echo -e "\e[0;94m ***** AaBbCs *** \[\\\e[0;94m\] *** \\\e[0;94m \\e[0m ---> iblue"
  echo -e "\e[0;95m ***** AaBbCs *** \[\\\e[0;95m\] *** \\\e[0;95m \\e[0m ---> ipurple"
  echo -e "\e[0;96m ***** AaBbCs *** \[\\\e[0;96m\] *** \\\e[0;96m \\e[0m ---> icyan"
  echo -e "\e[0;97m ***** AaBbCs *** \[\\\e[0;97m\] *** \\\e[0;97m \\e[0m ---> iwhite"

  echo ""
  echo "# Boldhighintensity"

  echo -e "\e[1;90m ***** AaBbCs *** \[\\\e[1;90m\] *** \\\e[1;90m \\e[0m ---> biblack"
  echo -e "\e[1;91m ***** AaBbCs *** \[\\\e[1;91m\] *** \\\e[1;91m \\e[0m ---> bired"
  echo -e "\e[1;92m ***** AaBbCs *** \[\\\e[1;92m\] *** \\\e[1;92m \\e[0m ---> bigreen"
  echo -e "\e[1;93m ***** AaBbCs *** \[\\\e[1;93m\] *** \\\e[1;93m \\e[0m ---> biyellow"
  echo -e "\e[1;94m ***** AaBbCs *** \[\\\e[1;94m\] *** \\\e[1;94m \\e[0m ---> biblue"
  echo -e "\e[1;95m ***** AaBbCs *** \[\\\e[1;95m\] *** \\\e[1;95m \\e[0m ---> bipurple"
  echo -e "\e[1;96m ***** AaBbCs *** \[\\\e[1;96m\] *** \\\e[1;96m \\e[0m ---> bicyan"
  echo -e "\e[1;97m ***** AaBbCs *** \[\\\e[1;97m\] *** \\\e[1;97m \\e[0m ---> biwhite"

  echo ""
  echo "# Highintensitybackgrounds"

  echo -e "\e[0;100m ***** AaBbCs *** \[\\\e[0;100m\] *** \\\e[0;100m \\e[0m ---> on_iblack"
  echo -e "\e[0;101m ***** AaBbCs *** \[\\\e[0;101m\] *** \\\e[0;101m \\e[0m ---> on_ired"
  echo -e "\e[0;102m ***** AaBbCs *** \[\\\e[0;102m\] *** \\\e[0;102m \\e[0m ---> on_igreen"
  echo -e "\e[0;103m ***** AaBbCs *** \[\\\e[0;103m\] *** \\\e[0;103m \\e[0m ---> on_iyellow"
  echo -e "\e[0;104m ***** AaBbCs *** \[\\\e[0;104m\] *** \\\e[0;104m \\e[0m ---> on_iblue"
  echo -e "\e[0;105m ***** AaBbCs *** \[\\\e[0;105m\] *** \\\e[0;105m \\e[0m ---> on_ipurple"
  echo -e "\e[0;106m ***** AaBbCs *** \[\\\e[0;106m\] *** \\\e[0;106m \\e[0m ---> on_icyan"
  echo -e "\e[0;107m ***** AaBbCs *** \[\\\e[0;107m\] *** \\\e[0;107m \\e[0m ---> on_iwhite"

  exit 0
}

color() {
  echo -e "\e[0;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 01 0;30m"
  echo -e "\e[0;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 02 0;31m"
  echo -e "\e[0;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 03 0;32m"
  echo -e "\e[0;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 04 0;33m"
  echo -e "\e[0;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 05 0;34m"
  echo -e "\e[0;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 06 0;35m"
  echo -e "\e[0;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 07 0;36m"
  echo -e "\e[0;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 08 0;37m"
  echo ""
  echo -e "\e[1;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 09 1;30m"
  echo -e "\e[1;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 10 1;31m"
  echo -e "\e[1;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 11 1;32m"
  echo -e "\e[1;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 12 1;33m"
  echo -e "\e[1;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 13 1;34m"
  echo -e "\e[1;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 14 1;35m"
  echo -e "\e[1;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 15 1;36m"
  echo -e "\e[1;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 16 1;37m"
  echo ""
  echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
  echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"

  exit 0
}


function show_colors() {
  if [ "$#" == 0 ]; then
	echo "Expected flag (-n | --numbers, -a | --all)"
	exit 1
  fi
  while [[ "$#" -gt 0 ]]; do
	case "$1" in
	  -n|--numbers)
		color
		;;
	  -a|--all)
		colors
		;;
	  *)
		echo "Expected flag (-n | --numbers, -a | --all)"
	esac
  done
}

show_colors "$@"
