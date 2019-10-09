#!/usr/bin/env bash

function uti() {
  mdls \
    -name kMDItemContentType \
    -name kMDItemContentTypeTree \
    -name kMDItemKind \
    "${1}"
}

if [[ "$#" == 0 ]]; then
  echo "Expected file"
  echo "Usage:"
  echo "  uti.sh <file>"
else
  uti "$@"
fi
