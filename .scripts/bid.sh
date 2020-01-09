#!/usr/bin/env zsh

function display_usage() {
  echo 
  echo "Usage: $0"
  echo "   -h,  Display this message"
  echo "   -a,  Specify Application"
  echo
  exit 1
}

function raise_error() {
  local error_message="$*"
  echo "${error_message}" 1>&2
}

function check_PlistBuddy() {
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
  check_PlistBuddy

  if [ "$#" -gt 0 ]; then
    case "$1" in
      "-a" | "--app" | "--application")
	print_bundle_identifier "$2"
	;;
      "-h" | "--help" )
	display_usage
	;;
      *)
	raise_error "Invalid option: $1"
	exit 1
	;;
    esac
  else
    display_usage
  fi

}

main "$@"
