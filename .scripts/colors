#!/bin/bash

if [ "$1" = "-fg" ]; then
    where=38
elif [ "$1" = "-bg" ]; then
    where=48
elif [ "$1" = "-term" ]; then
    echo
    echo Table for 16-color terminal escape sequences.
    echo Prefix with \\033 in bash.
    echo
    echo " bg  | fg codes"
    echo "-----+--------------------------------------------------------"
    for((bg=40;bg<=47;bg++)); do
        for((bold=0;bold<=1;bold++)) do
            if [ $bold == "0" ]; then
                echo -en "\033[0m""[${bg}m |"
            else
                echo -n "     |"
            fi
            for((fg=30;fg<=37;fg++)); do
                if [ $bold == "0" ]; then
                    echo -en "\033[${bg}m\033[${fg}m [${fg}m  "
                else
                    echo -en "\033[${bg}m\033[1;${fg}m [1;${fg}m"
                fi
            done
            echo -e "\033[0m"
        done
    done
    echo
    exit 1
else
    echo "Please specify -fg, -bg, or -term."
    exit 1
fi

echo 
echo Table for 256 colors with numbers.

echo
echo "First 16 colors"
for((color=0;color<16;color++)); do
    echo -en "\033[${where};5;${color}m ${color} "
    if (($color<10)); then
        echo -n " "
    fi
    if (($color==7)); then
        echo
    fi
done

echo -e "\033[m\n\nThe rest"
for((basecolor=0;basecolor<6;basecolor++)); do
    for((color=$basecolor+16;color<256;color=$color+6)); do
        echo -en "\033[${where};5;${color}m ${color} "
        if (($color<100)); then
            echo -n " "
        fi
    done
    echo
done

echo -e "\033[m"
