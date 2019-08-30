#!/usr/bin/env bash

while true;do
    stty_state="$(stty -g)" 
    # Save stty to reset to default
    stty raw isig -echo 
    # Set to raw and isig so nothing
    # is interpretted and turn echo off so 
    # nothing is printed to screen.
    keypress="$(dd count=1 2>/dev/null)"
    # Capture one character at a time
    # Redirect "errors" (from dd) output to dump
    keycode=$(printf "%s" "$keypress" | xxd -p)
    # Convert to hex
    stty "$stty_state"
    # Revert stty back
    printf "%s" "$keycode"
    # Print your key in hex
    printf "\n"
done
