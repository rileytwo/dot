#!/usr/bin/env bash

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
  local no_PlistBuddyFound="PlistBuddy was not found"
  [[ -f /usr/libexec/PlistBuddy ]] || { echo "${no_PlistBuddyFound}"; exit 1; }
}

function print_bundle_identifier() {
  /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' \
    "$1"/Contents/Info.plist
  }


function main() {

  check_PlistBuddy

  if [ "$#" -gt 0 ]; then
    case "$1" in
      "-a" | "--app" | "--application")
	shift
	print_bundle_identifier "$@"
	;;
      "-h" | "--help" )
	display_usage
	;;
      :)
	echo "-$1 requires an argument"
	exit 1
	;;
      *)
	echo "Invalid option: $1"
	exit 1
	;;
    esac
  else
    display_usage
  fi

}

main "$@"
