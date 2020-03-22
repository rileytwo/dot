#!/usr/bin/env zsh

YLW="$(echo -e "\e[1;93m")"
GRN="$(echo -e "\e[1;92m")"
BLU="$(echo -e "\e[1;94m")"
RED="$(echo -e "\e[1;91m")"
END="$(echo -e "\e[0m")"

NAME="$(basename $0)"

function display_usage() {
  echo ""
  echo "${NAME} takes an application as input and prints the associated"
  echo "CFBundleIdentifier from the application's Info.plist."
  echo ""
  echo "${YLW}USAGE:${END} ${BLU}${NAME}${END}"
  echo "  ${BLU}bi.sh${END} [APPLICATION NAME]"
  echo "  ${BLU}bi.sh${END} [-a] [PATH]"
  echo ""
  echo "${YLW}ARGS${END}:"
  echo "  <APPLICATION NAME>"
  echo "    The full name of an application located in /Applications."
  echo ""
  echo "    For example, to print the CFBundleIdentifier of Safari:"
  echo ""
  echo "      bi.sh Safari.app"
  echo ""
  echo "    If an application is not located in /Application, you must"
  echo "    pass -a and provide the full path to the application. See"
  echo "    below for more information."
  echo ""
  echo "${YLW}OPTIONS:${END}"
  echo "  ${GRN}-a${END}, ${GRN}--app${END}, ${GRN}--application${END}"
  echo "    Print the CFBundleIdentifier of the application at the"
  echo "    fully specified path. Passing -a, --app, or --application is"
  echo "    necessary if an application is NOT located in /Applications."
  echo ""
  echo "    Example:"
  echo "      bi.sh -a /Users/johnappleseed/Applications/SomeApp.app"
  echo ""
  echo "  ${GRN}-h${END}"
  echo "    Display this message and exit."
  echo ""
  exit 1
}

function raise_error() {
  local error_message="$*"
  echo "${error_message}" 1>&2
}

function check_plistbuddy() {
  local no_plistbuddy_found="PlistBuddy was not found"

  if [[ -f "/usr/libexec/PlistBuddy" ]]; then
    PBDY="/usr/libexec/PlistBuddy"
  else
    echo "${no_plistbuddy_found}"; exit 1;
  fi
}

function print_bundle_identifier() {
  ${PBDY} -c 'Print CFBundleIdentifier' "$@"/Contents/Info.plist
}


function main() {
  check_plistbuddy

  if [ "$#" -gt 0 ]; then
    case "$1" in
      "-a" | "--app" | "--application")

	if [[ -d "$2" && "$2" =~ ".app" ]]; then
	  print_bundle_identifier "$2" 
	else
	  echo "$2 is not an application"
	fi
	
	;;
      "*.app" | *.app )
	
	print_bundle_identifier /Applications/"$1"
	
	;;
      "-h" | "--help" )
	
	display_usage
	
	;;
      *)
	
	raise_error "Invalid option: $1"
	display_usage
	exit 1
	
	;;
    esac
  else
    display_usage
  fi
}

main "$@"
