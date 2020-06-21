#!/usr/bin/env zsh

function xmanpage() {
  open x-man-page://"$@";
}

function preman() {
  man -t "$@" | open -f -a "Preview";
}