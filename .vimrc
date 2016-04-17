"--------------------------  Leader ---------------------------"

set nocompatible            " be iMproved, get rid of Vi compatibility mode. required!
let mapleader = "," 	 	" default leader is \ but , is my prefered choice

"--------------------------  Files  ---------------------------"

so ~/.vim/plugins.vim
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"--------------------------  Settings  ---------------------------"

set autoread

"--------------------------  Theming  ---------------------------"

colorscheme override
set background=dark
set t_Co=256
syntax enable               " enable syntax highlighting (previously syntax on).
set nonumber                " set number
set ruler                   " Always show info along bottom.
set autoindent              " auto-indent
set tabstop=4               " tab spacing
set softtabstop=4           " unify
set shiftwidth=4            " indent/outdent by 4 columns
set shiftround              " always indent/outdent to the nearest tabstop
set expandtab               " use spaces instead of tabs
set smarttab                " use tabs at the start of a line, spaces elsewhere
set nowrap                  " don't wrap text
set paste                   " allow pasting without indentation
set guioptions+=c           " GUI Vim will not pop up a dialog box
set listchars=tab:▸\ ,eol:¬ " Define invisible symbols

"--------------------------  Status Line  ---------------------------"

set laststatus=2            " Always display the statusline in all windows
set showtabline=2           " Always display the tabline, even if there is only one tab
set noshowmode              " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Status line without powerline
"set statusline=%m           "modified flag
"set statusline+=%t          "tail of the filename
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}]     "file format
"set statusline+=%h          "help file flag
"set statusline+=%r          "read only flag
"set statusline+=%y          "filetype
"set statusline+=\ %F       "tail of the filename
"set statusline+=%=          "left/right separator
"set statusline+=%c,         "cursor column
"set statusline+=%l/%L       "cursor line/total lines
"set statusline+=\ %P        "percent through file

"-------------------------- Search ---------------------------"

set hlsearch                " highlight searched phrases.
set incsearch               " But do highlight as you type your search.
set ignorecase              " Make searches case-insensitive.

"-------------------------- Mappings ---------------------------"

" Edit .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Hide highlight after searching phrases
nmap <Leader><space> :nohlsearch<cr>

" Tab close
nmap <leader>tc :tabc<cr>

" Toggle `set list`
nmap <leader>l :set list!<CR>

" Toggle line number
nnoremap <leader>N :setlocal number!<cr>

" Toggle autowriteall
nmap <leader>S :call AutoSaveFiles()<cr>

" Save file if modified
nmap <leader>s :call SaveCurrentFile()<cr>

" Show diff if file is modified
nmap <leader>d :call IsModified()<cr><cr>

" Show diff if file is modified
nmap <leader>D :call ShowDiff()<cr><cr>

" Surround word with double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Copy selected to clipboard
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

" Toggle white space
nmap <leader>w :ToggleWhitespace<cr>

" Clean extra whitespace, call:
nmap <leader>W :StripWhitespace<cr>

" Clean Whitespace on save
nmap <leader>$ :ToggleStripWhitespaceOnSave<cr>

"-------------------------- Functions ---------------------------"

" Save current file if edited
function! SaveCurrentFile()
    if &modified
        echohl Question
        echo "Save file [y/n]?"
        echohl None

        let response = nr2char(getchar())
        if response ==? "y"
            w
            echom "File saved"
        endif
    else
        echom "No Edit!"
    endif
endfunction

" Save files when switching buffer
function! AutoSaveFiles()
    if &autowriteall
        set noautowriteall
    else
        set autowriteall
    endif
    echom   'autowriteall ' &autowriteall
endfunction

" If file has been modified do a git diff
" @TODO
" To compare two paths outside a working tree:
" usage: git diff [--no-index] <path> <path>
function! IsModified()
        silent !clear
        execute "!" . "git diff " . expand("%:p")
endfunction

" potionbytecode
function! ShowDiff()
    " Get the bytecode.
    let bytecode = system("git diff " . expand("%:p") . " 2>&1")

    " Open a new split and set it up.
    vsplit %.diff
    normal! ggdG
    setlocal buftype=nofile noswapfile
    set filetype=on filetype=enabled syntax=diff

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfunction

"-------------------------- Commands ---------------------------"

" Add powerline commands
command! PowerlineReloadColorscheme call Pl#ReloadColorscheme()

"-------------------------- Auto-commands ---------------------------"

" Source .vimrc file when saving it with a nested call
" Avoid issue with the powerline plug-in
" See also `autocmd-nested
" https://github.com/powerline/powerline/commit/5173246a939f1a665d1908c536be6f04e6717ef1
augroup autosourcing
        autocmd!
        autocmd BufWritePost $MYVIMRC,~/.dot/.vimrc,~/.vim/*.vim nested source $MYVIMRC | colorscheme override
        autocmd BufWritePost $MYVIMRC PowerlineReloadColorscheme
augroup END

" Whitespace default
let g:better_whitespace_verbosity=1
autocmd BufReadPre,FileReadPre * EnableWhitespace
" Strip whitespaces on save
"autocmd BufWritePre * StripWhitespace

" Call any function opening a new buffer
"augroup InitBuffer
"    autocmd!
"    autocmd BufEnter,WinEnter * call FunctionName()
"augroup END

" Enable syntax by file type
"autocmd BufNewFile,BufRead *.diff set syntax=diff
" Specify syntax file
"au! syntax diff source ~/.vim/syntax/diff_up.vim
" Set a filetype if the filetype was not detected at all
"au BufRead,BufNewFile *.foo setfiletype php
"To override any filetype which was already detected, use this instead (note the 'set filetype=' syntax):
"au BufRead,BufNewFile *.module set filetype=php

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
" :set list                 Show invisibles
