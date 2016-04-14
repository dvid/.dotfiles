#!/bin/bash

#touch ~/.vimrc
#echo "runtime! arch.vim" > ~/.vimrc

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create symlinks calling it from within .dot/ with a symlinks folder containing all files to be symlinked in the home directory
stow symlinks