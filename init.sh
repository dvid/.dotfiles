#!/bin/bash

#touch ~/.vimrc
#echo "runtime! arch.vim" > ~/.vimrc

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install Plugins
vim +PluginInstall +qall

# Create symlinks calling it from within .dot/ with a symlinks folder containing all files to be symlinked in the home directory
#stow symlinks

# ohmyzsh plugins

# fc-cache -fv ~/.fonts

# mkdir /usr/local/lib/python3.5/
# ln -s /Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/config-3.5m /usr/local/lib/python3.5/config
# ./configure --with-features=huge --enable-python3interp=dynamic --with-python3-config-dir=/usr/local/lib/python3.5/config vi_cv_path_python3=/usr/local/bin/python3.5 --with-compiledby=""

# pip install https://github.com/Lokaltog/powerline/tarball/develop
# pip install --user git+git://github.com/powerline/powerline

# cd /Users/admin/.dot/vendor/macvim-dev/macvim/
# make distclean
# /configure --with-features=huge --enable-pythoninterp=dynamic --with-python-config-dir=/usr/lib/python2.7/config --with-compiledby="dvid"
# ./configure --enable-pythoninterp=dynamic --with-python-config-dir=/usr/lib/python2.7/config vi_cv_path_python=/usr/local/bin/python2.7  --with-compiledby="dvid"
# make
