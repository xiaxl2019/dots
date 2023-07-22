#!/usr/bin/env bash

function fun1() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function fun2() {
    git clone https://github.com/junegunn/vim-plug.git
    [[ -d ~/.vim/autoload ]] || mkdir ~/.vim/autoload
    cp vim-plug/plug.vim ~/.vim/autoload
    rm vim-plug -rf
}

fun1 || fun2
