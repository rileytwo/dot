#!/usr/bin/env bash

function uti() {
  mdls \
    -name kMDItemContentType \
    -name kMDItemContentTypeTree \
    -name kMDItemKind \
    "${1}"
}
