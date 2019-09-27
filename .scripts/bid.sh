#!/usr/bin/env bash

display_usage() {
  echo 
  echo "Usage: $0"
  echo "   -h,  Display this message"
  echo "   -a,  Specify Application"
  echo
  exit 1
}

raise_error() {
  local error_message="$*"
  echo "${error_message}" 1>&2
}

get_bundle_identifier() {
  /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' \
    /Applications/"$1"/Contents/Info.plist
}

while getopts "ha" opt; do
  case $opt in
	a)
	  shift
	  get_bundle_identifier "$@"
	  ;;
	h)
	  display_usage
	  ;;
	:)
	  echo "-${opt} requires an argument"
	  exit 1
	  ;;
	*)
	  echo "Invalid option: ${opt}"
	  exit 1
	  ;;
  esac
done



