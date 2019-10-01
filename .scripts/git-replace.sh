#!/usr/bin/env bash

CONFIG=''
VALUE=''


display_usage() {
  echo
  echo "Usage: $0"
  echo "  -h, Display this message"
  echo "  -c <config>"
  echo "  -v <new>"
  echo
  exit 1
}

raise_error() {
  local error_message="$*"
  echo "${error_message}"
}


replace() {
  echo "Replacing ${CONFIG} with ${VALUE}..."
  git config --local "${CONFIG}" "${VALUE}"
}


if [ "$#" == 0 ]; then
  echo "$#"
  exit 1
fi


while [[ "$#" -gt 0 ]]; do
  key="$1"
  case $key in
    -c|--config)
      CONFIG="$2"
      shift
      shift
      ;;
    -v|--value)
      VALUE="$2"
      shift
      shift
      ;;
  esac
done

replace


