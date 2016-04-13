#!/bin/bash

#touch ~/.vimrc
#echo "runtime .dot/.vimrc" > ~/.vimrc

# Create symlinks calling it from within .dot/ with a symlinks folder containing all files to be symlinked in the home directory
stow symlinks
