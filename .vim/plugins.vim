filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

"--------------------------  Plugins  ---------------------------"

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/utl.vim'
Plugin 'vitorgalvao/autoswap_mac'
Plugin 'gavinbeatty/dragvisuals.vim'
Plugin 'dvid/vim-changeling'
Plugin 'joequery/Stupid-EasyMotion'
"Plugin 'easymotion/vim-easymotion'

"--------------------------  Themes  ---------------------------"

" Dark
Plugin 'RussellBradley/vim-spurs-away'
Plugin 'RussellBradley/vim-nets-away'
Plugin 'vim-scripts/sift'
Plugin 'endel/vim-github-colorscheme'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ipsod/nes.vim'
Plugin 'vim-scripts/obsidian2.vim'
Plugin 'kocakosm/hilal'
Plugin 'andreasvc/vim-256noir'
Plugin 'znake/znake-vim'
Plugin 'effkay/argonaut.vim'
Plugin 'kristiandupont/shades-of-teal'
Plugin 'widatama/vim-phoenix'
Plugin 'fxn/vim-monochrome'
Plugin 'vim-scripts/oceandeep'
Plugin 'pbrisbin/vim-colors-off'
Plugin 'ninja/sky'

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
