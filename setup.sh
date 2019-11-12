#!/usr/bin/env bash
# vim: tabstop=4:shiftwidth=4

## set color variables, simply because i like when shell scripts
## look nice

echo ""

RED="$(echo -e "\e[1;91m")"
GREEN="$(echo -e "\e[1;92m")"
YELLOW="$(echo -e "\e[1;93m")"
BLUE="$(echo -e "\e[1;94m")"
END="$(echo -e "\e[0m")"

S="${GREEN}*${END}"
Q="${YELLOW}?${END}"
X="${RED}X${END}"
YESNO="(${GREEN}y${END}/${RED}N${END}): "

DOT=${DOT:-~/.dot}
SETUP=${SETUP:-$DOT/.setup}
INSTALL=${INSTALL:-$SETUP/install}
SETTINGS=${SETTINGS:-$SETUP/settings}

function get_os() {
    case "$OSTYPE" in
    [Dd]arwin*)
        echo " ${S} Let's set up this ${BLUE}Mac${END}! ${S}"
        echo ""
        echo ""
        OS="mac"
        ;;
    [Ll]inux*)
        echo " ${S} WOO! ${BLUE}Linux${END}! ${S}"
        echo ""
        echo ""
        OS="linux"
        ;;
    [Ww]indows*)
        echo " ${S} huh? ${S}"
        echo ""
        echo ""
        OS="windows"
        ;;
    *)
        echo " ${S} I have ${RED}no idea${END} what ${RED}this is ${END}. ${S} "
        echo "    But let's give it a shot!"
        echo ""
        echo ""
        OS="NULL"
        ;;
    esac
}

# ask for administrator password
#echo "${YELLOW}You may need to enter your password.${END}"
#echo ""
#sudo -v
#
## keep-alive: update exiting `sudo` time stamp until script is finished
#while true; do
#    sleep 300
#    sudo -n true
#    kill -0 "$$" 2>/dev/null || exit
#done &

function quit_preferences() {
    if [[ "$OS" == "mac" ]]; then
        echo " ${S} Quitting System Preferences..."
        echo ""
        osascript -e 'tell application "System Preferences" to quit'
    fi
}

function invalid_answer() {
    echo "   ${X} Invalid answer. Enter \"y/yes\" or \"N/no\"" >&2
    echo ""
}

function source_files() {
    for ((i = 0; i < ${#sources[@]}; i++)); do
        source "${sources[$i]}"
    done
}

# Installing Brew & Xcode's Command Line Tools
function check_brew() {
    echo " ${S} Checking if ${BLUE}Homebrew${END} is installed..."
    echo ""
    if [[ "$(command -v brew)" == "" ]]; then
        retries=0
        max_retries=10

        while [ "$retries" -lt "$max_retries" ]; do
            echo "   - ${BLUE}Homebew${END} is ${YELLOW}not installed${END}."
            qstn="   ${Q} Would you like to install it now? ${YESNO}"

            read -r -p "$qstn" answer
            echo ""

            case "$answer" in
            y | Yes | yes)
                echo "   - Okay! Installing Homebrew."
                /usr/bin/ruby -e \
                    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

                echo ""
                echo "    Turning analytics off..."
                echo ""
                brew analytics off
                break
                ;;

            n | N | No | no)
                echo "   - Okay! Not installing ${BLUE}Homebrew${END}."
                echo ""
                break
                ;;

            *)
                invalid_answer
                if [ $((++retries)) -ge "$max_retries" ]; then
                    break
                    echo "     ${X} Too many invalid answers."
                fi
                ;;

            esac
        done

    else
        echo "   - Homebrew is installed!"
        echo ""
        brew analytics off
    fi
    echo ""
}

function check_install_dir() {
    echo " ${S} Checking for an install directory... (there should only be one!)"
    echo ""

    if [[ -d "${INSTALL}" ]]; then
        cd "$INSTALL" || echo "  - Something went ${RED}wrong :(${END}"
        echo "   - ${GREEN}Found it!${END}"
        echo ""

        echo "   - Checking for install scripts..."
        echo ""
        local sources=(./*)

        if [ ${#sources[@]} -eq 0 ]; then
            echo "     ${YELLOW}Didn't find any :(${END}"
            echo ""
        else
            echo "     ${GREEN}Found some.${END}"
            echo ""
            printf "     - %s\n" "${sources[@]}" | sed 's/\.\/install-//g'
            echo ""

            retries=0
            max_retries=10

            while [ "$retries" -lt "$max_retries" ]; do
                read -r -p "   ${Q} Would you like to install these programs ${YESNO}" answer
                echo ""
                case "$answer" in
                y | Yes | yes)
                    echo "     - Okay! Installing."
                    echo ""
                    source_files
                    echo ""
                    break
                    ;;

                n | N | No | no)
                    echo "     - Okay. Not installing."
                    echo ""
                    break
                    ;;

                *)
                    invalid_answer
                    if [ $((++retries)) -ge "$max_retries" ]; then
                        break
                        echo "     ${X} Too many invalid answers."
                    fi
                    ;;
                esac

            done

        fi

    else
        echo "    ${X} Didn't find one."
        echo ""
    fi
    echo ""
}

function check_defaults() {
    echo " ${S} Checking for settings directory... (there should only be one!!)"
    echo ""

    if [[ -d "${SETTINGS}" ]]; then
        cd "$SETTINGS" || echo "  - Something went ${RED}wrong :(${END}"
        echo "   - ${GREEN}Found it!${END}"
        echo ""

        echo "   - Checking for settings scripts..."
        echo ""
        local sources=(./*)

        retries=0
        max_retries=10
        while [ "$retries" -lt "$max_retries" ]; do

            qstn=" ${Q} Would you like to set your global settings? ${YESNO}"
            read -r -p "$qstn" answer
            echo ""
            case "$answer" in
            y | Yes | yes)
                echo "   - Okay! Doing that now."
                echo ""
                source_files
                break
                ;;
            n | N | No | no)
                echo "   - Okay! Not setting anything right now."
                echo ""
                break
                ;;
            *)
                invalid_answer
                if [ $((++retries)) -ge "$max_retries" ]; then
                    break
                    echo "     ${X} Too many invalid answers."
                fi
                ;;
            esac
        done
    fi
    echo ""
}

function setup() {
    get_os

    if [[ "$OS" == "mac" ]]; then
        check_brew
        check_defaults
    fi

    check_install_dir
}

setup

echo " ${S} ${GREEN}Done ${BLUE}:)${END}"
