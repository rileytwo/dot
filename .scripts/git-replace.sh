#!/usr/bin/env bash

CONFIG=''
VALUE=''


display_usage() {
  echo
  echo "Usage: $0"
  echo "  -h, Display this message"
  echo "  -r <config>"
  echo "  -n <new>"
  echo
  exit 1
}

replace() {
  echo "Replacing ${CONFIG} with ${VALUE}..."
  git config --local "${CONFIG}" "${VALUE}"
}



