#!/usr/bin/env bash

# ~/.dot/.preferences/.defaults

# close any system preferences panes to prevent from overriding
# settings this script will change
osascript -e 'tell application "System Preferences" to quit'

# ask for administrator password
sudo -v

# keep-alive: update exiting `sudo` time stamp until script is finished
while true; do sudo -n; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



# Installing Brew & Xcode's Command Line Tools

function brew_check() {
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

brew_check

#function dev_check() {
#  echo "Checking for install scripts..."
#
#  
#}



# show ~/Library
chflags nohidden ~/Library

# set help viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# search current folder by default, not entire drive
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# no .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable "Are you sure you want to open this application?" dialogue
defaults write com.apple.LaunchServices LSQuarantine -bool false

# disable smart dashes, period substitution, smart quotes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# disable press-and-hold in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# show all filename extensions
defaults write com.apple.finder AppleShowAllExtensions -bool true

# show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true

# show full POSIX path as finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# for use with QLColorCode and highlight (hasn't been working in Catalina)
#defaults write org.n8gray.QLColorCode pathHL /usr/local/bin/highlight
#defaults write org.n8gray.QLColorCode hlTheme moria

# indicator lights for open applications in dock
defaults write com.apple.dock show-process-indicators -bool true

# scroll while hovering over app in dock to show windows
defaults write com.apple.dock scroll-to-open -bool true

# disable crash report
defaults write com.apple.CrashReporter DialogueType -string "none"

# disable sudden motion sensor (not useful for SSDs)
#sudo pmset -a sms 0


# clean up
#for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
#           "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
#           "Terminal" "Twitter" "iCal";
#  do
#    kill all "${app}" > /dev/null 2>&1
#  done 
#sleep 1
#
## end setup
#
#
## reboot?
#function restart() {
#  read -r -p "Do you want to reboot your computer now? (y/N)" choice
#  case "$choice" in
#    y | Yes | yes )
#      echo "Yes";
#      exit
#      ;;
#    n | N | No | no)
#      echo "No";
#      exit
#      ;;
#    * )
#      echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return
#      ;;
#  esac
#}
#
## call restart
#if [[ "Yes" == $(reboot) ]]; then
#  echo "Rebooting..."
#  sudo sh -c 'reboot'
#  exit 0
#else
#  exit 1
#fi
