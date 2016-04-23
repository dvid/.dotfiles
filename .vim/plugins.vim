filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/utl.vim'
Plugin 'vitorgalvao/autoswap_mac'

call vundle#end()            " required

filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" vim-airline/vim-airline
" scrooloose/syntastic
" scrooloose/nerdtree
" jistr/vim-nerdtree-tabs
" tpope/vim-fugitive
" Valloric/YouCompleteMe
" Plugin 'NBUT-Developers/extra-instant-markdown'
" Plugin 'szw/vim-maximizer'
" Plugin 'mustache/vim-mustache-handlebars'
