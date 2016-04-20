
" "   Y8b Y88888P ,e,
" "    Y8b Y888P   "  888 888 8e  888,8,  e88'888
" "     Y8b Y8P   888 888 888 88b 888 "  d888  '8
" "      Y8b Y    888 888 888 888 888    Y888   ,
" "       Y8P     888 888 888 888 888     "88,e8'

"--------------------------  Leader ---------------------------"

set nocompatible            " be iMproved, get rid of Vi compatibility mode. required!
let mapleader = "," 	 	" default leader is \ but , is my prefered choice. NOTICE: set this before any mappings

"--------------------------  Files  ---------------------------"

so ~/.vim/plugins.vim
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"--------------------------  Settings  ---------------------------"

set autoread
set errorbells              " error bells
set visualbell              " Flash the screen insteal of beeping on errors
set t_vb=                   " And then disable even the flashing
set backupdir-=.            " Removes the current directory from the backup directory list
set backupdir^=~/.vim/backup    " Attempt to save backups
set directory=~/.vim/backup     " swp files
set clipboard=unnamed       " Enable default clipboard to system clipboard

"--------------------------  Hostname  ---------------------------"

" Switch hostname
" To view the key code of a corresponding key combination your terminal is sending to vim:
" $ sed -n l
" ^[^[[D = Alt Left  = <Esc><Esc>[D
" ^[^[[C = Alt Right = <Esc><Esc>[C
let machine = substitute(system('hostname'), "\n", "", "")
if 		machine == "Manjaro"

	let altleft="<Esc>[1;3D"
	let altright="<Esc>[1;3C"

elseif 	machine == "octogone"

	let altleft="<Esc><Esc>[D"
	let altright="<Esc><Esc>[C"

else
	
	let altleft="<A-left>"
	let altright="<A-right>"

endif

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
set guioptions-=l           " scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R
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
nnoremap <leader>n :setlocal number!<cr>

" Toggle autowriteall
nmap <leader>S :call AutoSaveFiles()<cr>

" Save file if modified
nmap <leader>s :call SaveCurrentFile()<cr>

" Show diff if file is modified
nmap <leader>d :call IsModified()<cr><cr>

" Show git diff
nmap <leader>D :call ShowGitDiff()<cr><cr>

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

" Indentation of visual blocks
vnoremap > >gv
vnoremap < <gv

" wincmd in insert mode
:imap <C-w> <C-o><C-w>

" resize windows
:map _ <C-W>-
:map + <C-W>+

" Move blocks
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Tagbar
nmap <F8> :TagbarToggle<CR>

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

" Run git diff in terminal
function! OpenSplit(bytecode)

        " Parse split list and look if splitted buffer already exists
        " from previous call and :bd on it before opening another one
        let s:bufNr = bufnr("$")
        while s:bufNr > 0
            if buflisted(s:bufNr)
                if (matchstr(bufname(s:bufNr), ".diff$") == ".diff")
                    if getbufvar(s:bufNr, '&modified') == 0
                        execute "bd ".s:bufNr
                    endif
                endif
            endif
            let s:bufNr = s:bufNr-1
        endwhile

        " Open a new split and set it up.
        vsplit %.diff
        normal! ggdG
        setlocal buftype=nofile noswapfile
        set filetype=on filetype=enabled syntax=diff

        " Insert the bytecode.
        call append(0, split(a:bytecode, '\v\n'))

        " Close buffer with :bd or Ctl+w then q to avoid keeping tab open.

endfunction

" If file has been modified do a git diff on its state in buffer
" with last saved file state
function! IsModified()

    if &modified
        " If you have a symlink of your .vimrc in the $HOME path
        " git diff on that file will create output for both files
        " symlink and real file. Instead make it a hard link:
        " ln source destination

        " Write BufferState in blob file and delete it after cmd
        :w %:p.blob
        let bytecode = system("git diff --no-index " . expand("%:p") . " " . expand("%:p") . ".blob")
        execute "!" . "rm " . expand("%:p").".blob"

        call OpenSplit(bytecode)

    else
      echom "No Edit!"
    endif

endfunction

" Run git diff in terminal
function! ShowDiff()
    silent !clear
    execute "!" . "git diff " . expand("%:p")
endfunction

" @TODO Line ranges
" command! -range Linediff      call linediff#Linediff(<line1>, <line2>)
" command! -bang  LinediffReset call linediff#LinediffReset(<q-bang>)
" Git diff from VCS for actual file in a vertical split
function! ShowGitDiff()

    " Get the diff.
    let bytecode = system("git diff " . expand("%:p") . " 2>&1")


    call OpenSplit(bytecode)

endfunction

" Auto tabular on space
" tpope's cucumbertables gist:
" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" @TODO search in dir

"-------------------------- Commands ---------------------------"

" Add powerline commands
command! PowerlineReloadColorscheme call Pl#ReloadColorscheme()

"-------------------------- Auto-commands ---------------------------"

" @TODO hide powerline in insert mode

" Source .vimrc file when saving it with a nested call
" Avoid issue with the powerline plug-in
" See also `autocmd-nested
" https://github.com/powerline/powerline/commit/5173246a939f1a665d1908c536be6f04e6717ef1
augroup autosourcing
        autocmd!
        autocmd BufWritePost $MYVIMRC,~/.dot/.vimrc,~/.vim/*.vim nested source $MYVIMRC | colorscheme override
        autocmd BufWritePost $MYVIMRC PowerlineReloadColorscheme
augroup END

" @TODO Source .zshrc in terminal when saving it

" Enable Whitespace by default
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

" Dynamic backup extension (ORIGINALFILENAME-YYYYMMDD-HHMMSS.vimbackup)
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>@ :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader># :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"-------------------------- Splits ---------------------------"

" Splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" Switch splits mappings /*{{{*/
nnoremap <A-Up> :normal <c-r>=SwitchWindow('+')<CR><CR>
nnoremap <A-Down> :normal <c-r>=SwitchWindow('-')<CR><CR>
nnoremap <A-Left> :normal <c-r>=SwitchWindow('<')<CR><CR>
nnoremap <A-Right> :normal <c-r>=SwitchWindow('>')<CR><CR>

function! SwitchWindow(dir)
  let this = winnr()
  if '+' == a:dir
    execute "normal \<c-w>k"
    elseif '-' == a:dir
    execute "normal \<c-w>j"
    elseif '>' == a:dir
    execute "normal \<c-w>l"
    elseif '<' == a:dir
    execute "normal \<c-w>h"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction
" /*}}}*/

"-------------------------- Tabs ---------------------------"

" This is for opening new tabs or
" switching between tabs {
    nnoremap <C-t> :tabnew<CR>
    "@TODO ctrl t in insert mode not working in linux nor mac
    inoremap <C-t> <Esc>:tabnew<CR>i
	:execute "nnoremap " . altleft . " :tabprevious<CR>"
	:execute "nnoremap " . altright . " :tabnext<CR>"
    "@TODO alt left / right not working in linux only
	:execute "inoremap " . altleft . " <Esc>:tabprevious<CR>i"
	:execute "inoremap " . altright . " <Esc>:tabnext<CR>i"
"}

" ctrl-I to switch between vertical or
" horizontal splitted windows {
    map <C-I> <C-W><C-W>
"}

" vim explorer {
  map <F4> :!ls<CR>:e
"}

"-------------------------- Help ---------------------------"

":help filename-modifiers
":help expand
":echo @%                   def/my.txt      directory/name of file (relative to the current working directory of /abc)
":echo expand('%:t')        my.txt          name of file ('tail')
":echo expand('%:p')        /abc/def/my.txt full path
":echo expand('%:p:h')      /abc/def        directory containing file ('head')
":echo expand('%:p:h:t')    def             First get the full path with :p (/abc/def/my.txt), then get the head of that with :h (/abc/def), then get the tail of that with :t (def)
":echo expand("%:p")                        absolute path
":echo expand("%:p:h")                      absolute path dirname
":echo expand("%:p:h")                      absolute path dirname dirname
":echo expand("%.")                         relative path
":echo expand("%.:h")                       relative path dirname
":echo expand("%.:h:h")                     relative path dirname dirname
":echo expand("<sfile>:p")                  absolute path to [this] vimscript


" [[ vimrc structure ]] {{{
"
" .vimrc -- global settings
" .vim/
"   after/  -- files that are loaded after sourced system plugins. override
"               system settings.
"       ftplugin/
"       plugin/
"       syntax/
"       ...
"   autoload/ -- automatically loaded scripts.
"   colors/   -- custom color schemes.
"   doc/      -- plugin documentation.
"   ftdetect/ -- filetype detection scripts.
"   ftplugin/ -- filetype plugins (load before system files, override by system)
"   indent/   -- indent scripts.
"   plugin/   -- plugins.
"   syntax/   -- syntax scripts.
"
" }}}

" Execute cmd in every buffer
" bufdo execute "normal! @a" | update

" Check if a split buffer already exists
"let bnr = bufwinnr(expand("%")) | if bnr > 0

"-------------------------- Cheatsheet ---------------------------"

" zz/ZZ 					Save and quit
" z. / zt / zb              Center the screen on your cursor
" G							bottom
" gg						top
" D                         delete to end of line = d$
" dw                        delete until end of word
" :tabc						close current tab
" :bd						buffer delete
" :bp                       buffer previous
" :nnngt                    Numbered tab:
" <C-W>h/l/j/k              Move through panes
" <C-W>w                    Toggle pane
" :viw                      Select word
" :sort                     Sort selected lines
" :set list                 Show invisibles
" <Ctrl>+o                  Switch to normal mode for one command
" ci' / ci" / ci< / ci)     Change text in quotes
"e                          Move to the end of a word.
"w                          Move forward to the beginning of a word.
"3w                         Move forward three words.
"W                          Move forward a WORD (any non-whitespace characters).
"b                          Move backward to the beginning of a word.
"3b                         Move backward three words.
"$                          Move to the end of the line.
"0                          Move to the beginning of the line.
"^                          Move to the first non-blank character of the line.
")                          Jump forward one sentence.
"(                          Jump backward one sentence.
"}                          Jump forward one paragraph.
"{                          Jump backward one paragraph.
"H                          Jump to the top of the screen.
"M                          Jump to the middle of the screen.
"L                          Jump to the bottom of the screen.
"10<PageUp> or 10<CTRL-B>   Move 10 pages up.
"5<PageDown> or 5<CTRL-F>   Move 5 pages down.
"G                          Jump to end of file.
"1G                         Jump to beginning of file (same as gg).
"50G                        Jump to line 50.
"'m                         Jump to the beginning of the line of mark m.
"`m                         Jump to the cursor position of mark m.
"''                         Return to the line where the cursor was before the latest jump.(Two single quotes.)
"``                         Return to the cursor position before the latest jump (undo the jump).(Two back ticks. This is above the Tab key on some keyboards.)
" %                         Jump to corresponding item, e.g. from an open brace to its matching closing brace.
" Shift left right up down  In insert mode
" Cmd Shift D               vsplit terminal
" Cw | / Cw=                show / hide split
" Cw T                      Move any open window to it's own tab
" add                       delete it to register a / add as many in register a
" ap                        paste it from register a
" :m 'a                     move current line to after line with mark a (see using marks)
" :m 'a-1                   move current line to before line with mark a
" :m '}-1                   move current line to the end of the current paragraph
" :5,7m 21                  move lines 5, 6 and 7 to after line 21
" :5,7m 0                   move lines 5, 6 and 7 to before first line
" :5,7m $                   move lines 5, 6 and 7 to after last line
" :.,.+4m 21                move 5 lines starting at current line to after line 21
" :,+4m14                   same (. for current line is assumed)
