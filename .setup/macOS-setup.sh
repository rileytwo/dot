#!/usr/bin/env bash

# ~/.dot/.preferences/.defaults

# close any system preferences panes to prevent from overriding
# settings this script will change

OS=''

function get_os() {
  case "$OSTYPE" in
    [Dd]arwin)
      echo "Let's set up this Mac!"
      OS="mac"
      exit 0
      ;;
    [Ll]inux)
      echo "WOO! Linux!"
      OS="linux"
      exit 0
      ;;
    [Ww]indows)
      echo "huh?"
      OS="windows"
      exit 0
      ;;
    *)
      echo "i have no idea what this is"
      OS="NULL"
      exit 1
  esac
}

if [[ "$OS" == "mac" ]]; then
  echo "Quitting System Preferences..."
  osascript -e 'tell application "System Preferences" to quit'
fi

# ask for administrator password
echo "Please enter your password"
sudo -v
# keep-alive: update exiting `sudo` time stamp until script is finished
while true; do sudo -n; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Installing Brew & Xcode's Command Line Tools
function check_brew() {
  echo "Checking if Homebrew is installed..."
  echo ""
  if [[ "$(command -v brew)" == "" ]]; then
    read -r -p \
      "Homebew is not installed. Would you like to install it now? (y/N)" choice
    case "$choice" in
      y  | Yes | yes)
        echo "Installing Homebrew..."
        /usr/bin/ruby -e \
          "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo ""
        echo "Turning analytics off..."
        brew analytics off
        exit 0
        ;;
      n | N | No | no)
        echo "No"
        exit 0
        ;;
      * )
        echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return
        ;;
      esac
  else
    echo "Homebrew is installed!"
    brew analytics off
    exit 0
  fi
}


function check_install() {
  if [[ -d "./install" ]]; then
    cd './install' || \
      echo "Something went wrong" 
    
    local install_scripts=('./*')
    
    echo "Checking for install scripts..."
    
    if [ ${#install_scripts[@]} -gt 0 ]; then
      echo "Found some!"
      printf '%s\n' "${install_scripts[@]}" | sed 's/\.\/install-//g'
      echo ""

      read -r -p "Would you like to install these programs (y/N)" choice
      case "$choice" in
        y | Yes | yes)
          echo "Installing..."
          ;;
        n | N | No | no)
          echo "Okay! Not installing"
          exit 0
          ;;
        * )
          echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return
          ;;
      esac
    fi
  
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
        
        # disable "Are you sure you want to open this application?" dialogue
        defaults write com.apple.LaunchServices LSQuarantine -bool false
        ;;
      n | N | No | no)
        echo "Okay! Not setting any defaults right now."
        exit 0
        ;;
      * )
        echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return
        ;;
    esac

  else
    :
  fi
}



brew_check
check_install
set_defaults

echo "Done!"

