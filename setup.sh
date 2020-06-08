#!/usr/bin/env zsh
# vim: tabstop=2:shiftwidth=2


####
# set color variables, simply because i like when shell scripts
# look nice

YLW="$(echo -e "\e[1;93m")"
GRN="$(echo -e "\e[1;92m")"
BLU="$(echo -e "\e[1;94m")"
RED="$(echo -e "\e[1;91m")"
END="$(echo -e "\e[0m")"

####
# i'm also quite fond of consistency and
# reusable variables

S="${GRN}*${END}"
Q="${YLW}?${END}"
X="${RED}X${END}"
YESNO="(${GRN}y${END}/${RED}N${END}): "


DOT=${DOT:-~/.dot}
SETUP=${SETUP:-$DOT/.setup}
INSTALL=${INSTALL:-$SETUP/install}
SETTINGS=${SETTINGS:-$SETUP/settings}


function get_os() {
  case "$OSTYPE" in
    [Dd]arwin*)
      echo "${S} Let's set up this ${BLU}Mac${END}! ${S}"
      echo ""
      echo ""
      OS="mac"
      ;;
    [Ll]inux*)
      echo "${S} WOO! ${BLU}Linux${END}! ${S}"
      echo ""
      echo ""
      OS="linux"
      ;;
    [Ww]indows*)
      echo "${S} huh? ${S}"
      echo ""
      echo ""
      OS="windows"
      ;;
    *)
      echo "${S} I have ${RED}no idea${END} what ${RED}this is ${END}. ${S} "
      echo "    But let's give it a shot!"
      echo ""
      echo ""
      OS="NULL"
      ;;
  esac
}

function quit_preferences() {
  if [[ "$OS" == "mac" ]]; then
    echo "${S} Quitting System Preferences..."
    echo ""
    osascript -e 'tell application "System Preferences" to quit'
  fi
}

function source_files() {
  for ((i = 0; i < ${#sources[@]}; i++)); do
    source "${sources[$i]}"
  done
}


function reply() {
  local response="$*"
  echo "  ${response}" 1>&2
}

function ask() {
  local question="$*"
  echo "?  ${Q} ${question} ${YESNO}"
}

function invalid_answer() {
  echo "  ${X} Invalid answer. Enter \"y/yes\" or \"N/no\"" >&2
  echo "  $((max_retries - ++retries)) attempts remaining."
  echo ""
}



# Installing Brew & Xcode's Command Line Tools
function check_brew() {
  echo "${S} Checking if ${BLU}Homebrew${END} is installed..."
  echo ""
  if [[ "$(command -v brew)" == "" ]]; then
    retries=0
    max_retries=5
    while [ "$retries" -lt "$max_retries" ]; do
      reply "- ${BLU}Homebew${END} is ${YLW}not installed${END}."
      qstn="$(ask "Would you like to install it now?")"
      read -q "$qstn" answer
      echo ""
      case "$answer" in
        "y" | "Y" | "yes" | "Yes")
          reply "- Okay! Installing Homebrew."
          /usr/bin/ruby -e \
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

          echo ""
          reply "Turning analytics off..."
          echo ""
          brew analytics off
          break
          ;;
        "n" | "N" | "no" | "No")
          reply "- Okay! Not installing ${BLU}Homebrew${END}."
          echo ""
          break
          ;;
        *)
          invalid_answer
          if [ "$retries" -ge "$max_retries" ]; then
            reply "${X} Too many invalid answers."
            break
          fi
          ;;

        esac
      done
    else
      reply "- Homebrew is installed!"
      echo ""
      brew analytics off
  fi
  echo ""
}


function check_settings() {
  echo "${S} Checking for settings directory... (there should only be one!!)"
  echo ""
  if [[ -d "${SETTINGS}" ]]; then
    cd "$SETTINGS" || echo "  - Something went ${RED}wrong :(${END}"
    reply "- ${GRN}Found it!${END}"
    echo ""

    reply "- Checking for settings scripts..."
    echo ""
    local sources=(./*)
    retries=0
    max_retries=5
    while [ "$retries" -lt "$max_retries" ]; do
      qstn="$(ask "Would you like to set your global settings?")"
      read "$qstn" answer
      echo ""
      case "$answer" in
        "y" | "Y" | "yes" | "Yes")
          reply "- Okay! Doing that now."
          echo ""
          source_files
          break
          ;;
        "n" | "N" | "no" | "no")
          reply "- Okay! Not setting anything right now."
          echo ""
          break
          ;;
        *)
          invalid_answer
          if [ "$retries" -ge "$max_retries" ]; then
            reply "${X} Too many invalid answers."
            break
          fi
          ;;
      esac
    done
  fi
  echo ""
}


function check_install_dir() {
  echo "${S} Checking for an install directory... (there should only be one!)"
  echo ""

  if [[ -d "${INSTALL}" ]]; then
    cd "$INSTALL" || echo "  - Something went ${RED}wrong :(${END}"
    reply "- ${GRN}Found it!${END}"
    echo ""

    reply "- Checking for install scripts..."
    echo ""
    local sources=(./*)

    if [ ${#sources[@]} -eq 0 ]; then
      reply "${YLW}Didn't find any :(${END}"
      echo ""
    else
      reply "${GRN}Found some.${END}"
      echo ""
      printf "    - %s\n" "${sources[@]}" | sed 's/\.\/install-//g'
      echo ""

      retries=0
      max_retries=5

      while [ "$retries" -lt "$max_retries" ]; do
        qstn="$(ask "Would you like to install these programs")"
        read "$qstn" answer
        echo ""
        case "$answer" in
          "y" | "Y" | "yes" | "Yes")
            reply "- Okay! Installing."
            echo ""
            source_files
            echo ""
            break
            ;;
          "n" | "N" | "no" | "No")
            reply "- Okay. Not installing."
            echo ""
            break
            ;;
          *)
            invalid_answer
            if [ "$retries" -ge "$max_retries" ]; then
              reply "${X} Too many invalid answers."
              break
            fi
            ;;
        esac
      done

    fi

  else
    reply "${X} Didn't find one."
    echo ""
  fi
  echo ""
}


function setup() {
  get_os

  if [[ "$OS" == "mac" ]]; then
    check_brew
    check_settings
  fi

  check_install_dir
}

setup

echo "${S} ${GRN}Done ${BLU}:)${END}"
