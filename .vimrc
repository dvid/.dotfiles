"--------------------------  Leader ---------------------------"

set nocompatible            " be iMproved, get rid of Vi compatibility mode. required!
let mapleader = "," 	 	" default leader is \ but , is my prefered choice	

"--------------------------  Files  ---------------------------"

so ~/.vim/plugins.vim

"--------------------------  Settings  ---------------------------"

set autoread

"--------------------------  Theming  ---------------------------"

colorscheme gotham256
set background=dark
set t_Co=256

" Function has to be called before syntax enable
" Autosourcing file won't alter colors
function! AfterColor()
    highlight Identifier ctermfg=Green guifg=#006F00
endfunction
:call AfterColor()

syntax enable               " enable syntax highlighting (previously syntax on).
set nonumber				" set number  		
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
set guioptions+=c           " GUI Vim will not pop up a dialog box

"--------------------------  Status Line  ---------------------------"

set laststatus=2        " last window always has a statusline

set statusline=%t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=\ %F       "tail of the filename
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"-------------------------- Search ---------------------------"

set hlsearch 				" highlight searched phrases.
set incsearch               " But do highlight as you type your search.
set ignorecase              " Make searches case-insensitive.

"-------------------------- Mappings ---------------------------"

" Edit .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Hide highlight after searching phrases
nmap <Leader><space> :nohlsearch<cr>

" Tab close
nmap <leader>tc :tabc<cr>

" Toggle line number
:nnoremap <leader>N :setlocal number!<cr>

"-------------------------- Auto-commands ---------------------------"

" Source .vimrc file when saving it
augroup autosourcing
        autocmd!
        autocmd BufWritePost $MYVIMRC,~/.dot/.vimrc,~/.vim/*.vim source $MYVIMRC | colorscheme gotham256 | :call AfterColor()
augroup END

"autocmd BufNewFile,BufRead *.diff set syntax=diff
"au! syntax diff source ~/.vim/syntax/diff_up.vim

"-------------------------- Cheatsheet ---------------------------"

" zz 						Center the screen on your cursor
" G							bottom
" gg						top
" D                         delete to end of line = d$
" dw                        delete until end of word
" :tabc						close current tab
" :bd						buffer delete
" :bp                       buffer previous
" :gt                       Next tab
" :gT                       Prior tab
" :nnngt                    Numbered tab:
" <C-W>h/l/j/k              Move through panes
" <C-W>w                    Toggle pane
" :viw                      Select word
" :sort                     Sort selected lines
