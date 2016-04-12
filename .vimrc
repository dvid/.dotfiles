
"--------------------------  Settings  ---------------------------"

set nocompatible          	" get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on 	" filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              	" enable 256-color mode.
syntax enable             	" enable syntax highlighting (previously syntax on).
set background=dark
colorscheme gotham256
"colorscheme vividchalk
set nonumber				" set number  		
set laststatus=2          	" last window always has a statusline
filetype indent on        	" activates indenting for files
set ruler                 	" Always show info along bottom.
set autoindent            	" auto-indent
set tabstop=4             	" tab spacing
set softtabstop=4         	" unify
set shiftwidth=4          	" indent/outdent by 4 columns
set shiftround            	" always indent/outdent to the nearest tabstop
set expandtab             	" use spaces instead of tabs
set smarttab              	" use tabs at the start of a line, spaces elsewhere
set nowrap                	" don't wrap text
set paste                 	" allow pasting without indentation

let mapleader = "," 	 	" default leader is \ but , is my prefered choice	


"-------------------------- Search ---------------------------"

set hlsearch 				" highlight searched phrases.
set incsearch               " But do highlight as you type your search.
set ignorecase              " Make searches case-insensitive.


"-------------------------- Mappings ---------------------------"

" Edit .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Hide highlight after searching phrases
nmap <Leader><space> :nohlsearch<cr>


"-------------------------- Auto-commands ---------------------------"

" Source .vimrc file when saving it
augroup autosourcing
		autocmd!
		autocmd BufWritePost .vimrc source %
augroup END


"-------------------------- Shortcuts ---------------------------"

" zz 						Center the screen on your cursor
" G							bottom
" gg						top
" :tabc						close current tab
" :bd						buffer delete
