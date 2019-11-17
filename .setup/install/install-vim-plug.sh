#!/usr/bin/env bash

bash -c \
    "$(curl -fLo ~/.vim/autoload/plug.vim \
        --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"
