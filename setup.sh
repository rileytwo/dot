#!/usr/bin/env bash
# vim: tabstop=2:shiftwidth=2


OS=''

function get_os() {
  case "$OSTYPE" in
    [Dd]arwin* )
      echo "Let's set up this Mac!"
      OS="mac"
      ;;
    [Ll]inux* )
      echo "WOO! Linux!"
      OS="linux"
      ;;
    [Ww]indows* )
      echo "huh?"
      OS="windows"
      ;;
    *)
      echo "I have no idea what this is. But let's give it a shot!"
      OS="NULL"
  esac
}

if [[ "$OS" == "mac" ]]; then
  echo "Quitting System Preferences..."
  echo ""
  osascript -e 'tell application "System Preferences" to quit'
fi

# ask for administrator password
echo "Please enter your password"
echo ""
sudo -v

# keep-alive: update exiting `sudo` time stamp until script is finished
while true; do
  sleep 300
  sudo -n true
  kill -0 "$$" 2>/dev/null || exit
done &

# Installing Brew & Xcode's Command Line Tools
function check_brew() {
  echo "Checking if Homebrew is installed..."
  echo ""
  if [[ "$(command -v brew)" == "" ]]; then
    retry=0
    max_retry=10

    while [ "$retry" -lt "$max_retry" ]; do
      read -r -p \
        "Homebew is not installed. Would you like to install it now? (y/N)" choice;

      case "$choice" in
        y  | Yes | yes )
          echo "Installing Homebrew..."
          /usr/bin/ruby -e \
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

          echo ""
          echo "Turning analytics off..."
          brew analytics off
          ;;

        n | N | No | no )
          echo "No"
          ;;

        * )
          echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" >&2
          if [ $((++retries)) -ge "$max_retry" ]; then
            break 2;
          fi
          ;;

        esac
      done

    else
      echo "Homebrew is installed!"
      echo ""
      echo ""
      brew analytics off
  fi
}


function check_install_dir() {
  echo "Checking for an install directory... (there should only be one)"
  echo ""
  if [[ -d "./install" || -d "../install" ]]; then
    cd './install' || cd '../install' || echo "Something went wrong"; 
    echo "Found it!"
    echo ""

    echo "Checking for install scripts..."
    echo ""
    local install_scripts=(./*)

    if [ ${#install_scripts[@]} -eq 0 ]; then
      echo "Didn't find any."
      echo ""
    else
      echo "Found some."
      echo ""
      printf '%s\n' "${install_scripts[@]}" #| sed 's/\.\/install-//g'
      echo ""

      read -r -p "Would you like to install these programs (y/N)" choice
      case "$choice" in
        y | Yes | yes )
          echo "Installing..."
          echo ""
          for (( i=0; i<${#install_scripts[@]}; i++ )); do
            source "${install_scripts[$i]}"
          done 
          echo ""
          ;;

        n | N | No | no )
          echo "Okay. Not installing."
          echo ""
          ;;

        * )
          echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return
          ;;

      esac
    fi
  else
    echo "Didn't find one."
    echo ""
  fi
}

function set_defaults() {
  if [[ "$OS" == "mac" ]]; then
    read -r -p "Would you like to set default preferences? (y/N)" choice
    case "$choice" in
      y | Yes | yes)
        echo "Setting default preferences..."
        chflags nohidden ~/Library
        defaults write com.apple.helpviewer DevMode -bool true
        defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
        defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
        defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
        defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
        defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
        defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
        defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
        defaults write com.apple.finder AppleShowAllFiles -bool true
        defaults write com.apple.finder AppleShowAllExtensions -bool true
        defaults write com.apple.finder ShowPathbar -bool true
        defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
        defaults write com.apple.finder _FXSortFoldersFirst -bool true
        defaults write com.apple.dock show-process-indicators -bool true
        defaults write com.apple.dock scroll-to-open -bool true
        #
        # disable "Are you sure you want to open this application?" dialogue
        defaults write com.apple.LaunchServices LSQuarantine -bool false
        ;;
      n | N | No | no)
        echo "Okay! Not setting any defaults right now."
        ;;
      * )
        echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return
        ;;
    esac
  else
    :
  fi
}



get_os
#check_brew
check_install_dir
#set_defaults

echo "Done :)"
