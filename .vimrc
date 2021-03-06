
" "   Y8b Y88888P ,e,
" "    Y8b Y888P   "  888 888 8e  888,8,  e88'888
" "     Y8b Y8P   888 888 888 88b 888 "  d888  '8
" "      Y8b Y    888 888 888 888 888    Y888   ,
" "       Y8P     888 888 888 888 888     "88,e8'

"--------------------------  Leader ---------------------------"

set nocompatible            					" be iMproved, get rid of Vi compatibility mode. required!
let mapleader = ","

"--------------------------  Files  ---------------------------"

so ~/.vim/plugins.vim

"--------------------------  Settings  ---------------------------"

set autoread                                    " Auto loading files when externally edited
set errorbells                                  " error bells
set visualbell                                  " Flash the screen insteal of beeping on errors
set t_vb=                                       " And then disable even the flashing
set backupskip=/tmp/*,/private/tmp/*"           " Make Vim able to edit crontab files again.
set backupdir-=.                                " Removes the current directory from the backup directory list
set backupdir^=~/.vim/backup                    " Attempt to save backups
set directory=~/.vim/backup                     " swp files
set clipboard=unnamed                           " Enable default clipboard to system clipboard
set notimeout                                   " Time out on key codes but not mappings.
set ttimeout                                    " Basically this makes terminal Vim work sanely.
set ttimeoutlen=10                              " see bitbucket.org/sjl/dotfiles
set splitbelow 									" Make splits default to below... set splitright

"--------------------------  Hostname  ---------------------------"

" Switch hostname
let machine = substitute(system('hostname'), "\n", "", "")

if machine == "Manjaro"

	let shiftup = "<Esc>[a"
	let shiftdown = "<Esc>[b"
	let altleft="<Esc><Esc>[D"
	let altright="<Esc><Esc>[C"

	set showtabline=2           				" Always display the tabline, even if there is only one tab

    " Powerline is only set vim
    set rtp+=~/.dot/vendor/powerline/powerline/powerline/bindings/vim/

elseif 	machine == "captan.local" || machine == "octogone" || machine == "gbw-l-m0013.local"

	let shiftup = "<S-Up>"
	let shiftdown = "<S-Down>"

    if has("gui_running")

        " Map alt key
        let altleft="<A-Left>"
        let altright="<A-Right>"

		set macligatures
        "set guicursor+=a:blinkon0
        " :set guifont=*						" Open typo gui
        " :set guifont? 						" Show actual font
        set guifont=Menlo\ Regular:h18

        let g:onedark_termcolors=256
        let g:onedark_terminal_italics=1

        " set fuoptions="1920,1200"
        set fullscreen

        set guioptions+=c       				" GUI Vim will not pop up a dialog box
        set guioptions-=l       				" scrollbars
        set guioptions-=L
        set guioptions-=r
        set guioptions-=R
        set guioptions-=e						" no guitabs
		set showtabline=1           			" Only show tabs > 1
		set guitablabel=\ %t\ %M
		" set title titlestring=""
        set guicursor+=n-v-c:blinkon0			" turn blinking off for normal and visual mode
		set guicursor+=i:ver20-iCursor			" define icursor as default

        " Status line without powerline
        set statusline+=%#warningmsg#
        set statusline=%m           			"modified flag
        set statusline+=%t          			"tail of the filename
        set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
        set statusline+=%{&ff}]     			"file format
        set statusline+=%h          			"help file flag
        set statusline+=%r          			"read only flag
        set statusline+=%y          			"filetype
        set statusline+=\ %F       				"tail of the filename
        set statusline+=%=          			"left/right separator
        set statusline+=%c,         			"cursor column
        set statusline+=%l/%L       			"cursor line/total lines
        set statusline+=\ %P        			"percent through file

	    "let macvim_hig_shift_movement = 1		"see macvim gvimrc
	    let macvim_skip_cmd_opt_movement = 1	" ~/.dot/vendor/macvim-dev/macvim/src/MacVim/gvimrc
		"behave xterm							"get visual mode work normal again in macvim when selectmode already set

	else

		set showtabline=2           			" Always display the tabline, even if there is only one tab

        " Map alt key
		let altleft="<Esc><Esc>[D"
		let altright="<Esc><Esc>[C"

		" Powerline is only set vim
        set rtp+=~/.dot/vendor/powerline/powerline/powerline/bindings/vim/

    endif

else

	let shiftup = "<S-Up>"
	let shiftdown = "<S-Down>"
	let altleft="<A-left>"
	let altright="<A-right>"

endif

"--------------------------  Theming  ---------------------------"

set t_Co=256				" enable 256 colors in vim before setting the theme
colorscheme override		" enable override wich loads gotham256 & overrides it
set background=dark
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
set scrolloff=999           " lines you would like to see above and below the cursor
set listchars=tab:▸\ ,eol:¬ " Define invisible symbols
set winminheight=0

" "We'll fake a custom left padding for each window.
" hi LineNr guibg=bg
" set foldcolumn=2
" hi foldcolumn guibg=bg
" "Get rid of ugly split borders.
" hi vertsplit guifg=bg guibg=bg

"--------------------------  Status Line  ---------------------------"

set laststatus=2            " Always display the statusline in all windows
set noshowmode              " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"-------------------------- Search ---------------------------"

set hlsearch                " highlight searched phrases.
set incsearch               " But do highlight as you type your search.
set ignorecase              " Make searches case-insensitive.

"-------------------------- Mappings ---------------------------"

" To view the key code of a corresponding key combination
" your terminal is sending to vim:
" $ cat -v
" $ sed -n l
" Alt Left  = ^[^[[D = <Esc><Esc>[D
" Alt Right = ^[^[[C = <Esc><Esc>[C

" In terminal type:
" xmodmap -pke | grep 'Shift'
" Get code from key
" search for term mapping:
" http://vimdoc.sourceforge.net/htmldoc/term.html
"exe 'set t_kB=' . nr2char(50) . '[B'
"exe 'set t_kB=' . nr2char(50) . '[A'

" To test if your keys are already mapped:
" :map <A-key>

" Jump
execute "noremap " . shiftup . " 10k<CR>"
execute "noremap " . shiftdown . " 10j<CR>"

" Edit .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" close buffers
nmap <leader>x :bd<cr>

" run python code from page
nnoremap <F4> :exec '!python' shellescape(@%, 1)<cr>
":w<CR>:!python %<CR>"

" Hide highlight after searching phrases
nmap <Leader><space> :nohlsearch<cr>

" Tab close
nmap <leader>tc :tabc<cr>

" Toggle line number
nnoremap <leader>n :call SwitchLineNumbers()<cr>

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

" Toggle `set list`
nmap <leader>l :set list!<CR>

" Toggle white space
nmap <leader>w :ToggleWhitespace<cr>

" Clean extra whitespace, call:
nmap <leader>W :StripWhitespace<cr>

" Clean Whitespace on save
nmap <leader>$ :ToggleStripWhitespaceOnSave<cr>

" Drush cc all
nnoremap <leader>dc :execute 'silent !drush cc all &' | redraw!

" Uppercase
nnoremap <C-u> gUiw
inoremap <C-u> <ESC>gUiwea

" Indentation of visual blocks
vnoremap < >gv
vnoremap > <gv

"execute "nnoremap " . <C-M> . " :wincmd |<CR>"
"nnoremap <C-A>m  :wincmd |<CR>

" wincmd in insert mode
"imap <C-w> <C-o><C-w>

" Move blocks
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Tagbar
nmap <F8> :TagbarToggle<CR>

" @TODO 80 char mode
nmap <leader>l :call EightyColumnRule()<cr>

" The first two lines make possible matches appear as lists. You can use either or both.
" The third line effectively allows for Tabs to appear in key maps.
set wildmenu
set wildmode=list:full
set wildcharm=<C-z>
nnoremap <leader>c :colorscheme <C-z><S-Tab>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>sl ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"-------------------------- Functions ---------------------------"

" @TODO ? shows help (mappings)
" @TODO b add it to bookmarks
" @TODO search in dir

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

    echom 'autowriteall ' &autowriteall

endfunction

" 80 characters line length
let g:eightyrule = 1
function! EightyColumnRule()

    if g:eightyrule
		let g:eightyrule=0
		let &colorcolumn=""
    else
		let g:eightyrule=1
		let &colorcolumn=join(range(81,999),",")
		" if colorcolumn highlight hasn't been specified yet:
		" highlight ColorColumn ctermbg=235 guibg=#2c2d27
		let &colorcolumn="80,".join(range(120,999),",")
    endif

endfunction

" Switch between line numbers - relative numbers and no number
let g:linenumberstate = 1
function! SwitchLineNumbers()

    if g:linenumberstate == 1
        let g:linenumberstate = 2
		setlocal number
    elseif g:linenumberstate == 2
        let g:linenumberstate = 3
		set relativenumber
    elseif g:linenumberstate == 3
        let g:linenumberstate = 1
		setlocal nonumber
		set norelativenumber
    endif

endfunction

" CURSOR COLOUR When in terminal
" change the color of the cursor to white in command mode,and orange in insert mode
" if &term =~ "xterm\\|rxvt"
" :silent !echo -ne "\033]12;white\007"
" let &t_SI = "\033]12;orange\007"
" let &t_EI = "\033]12;white\007"
" autocmd VimLeave * :!echo -ne "\033]12;white\007"
" endif

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

"-------------------------- Commands ---------------------------"

" Add powerline commands
" command! PowerlineReloadColorscheme call Pl#ReloadColorscheme()

"-------------------------- Auto-commands ---------------------------"

" @TODO hide powerline in insert mode

" Resize splits when the window is resized
au VimResized * :wincmd =

" Source .vimrc file when saving it with a nested call
" Avoid issue with the powerline plug-in
" See also `autocmd-nested
" https://github.com/powerline/powerline/commit/5173246a939f1a665d1908c536be6f04e6717ef1
augroup autosourcing
        autocmd!
        autocmd BufWritePost $MYVIMRC,~/.dot/.vimrc,~/.vim/*.vim nested source % | colorscheme override
        "autocmd BufWritePost $MYVIMRC PowerlineReloadColorscheme
augroup END

" @TODO Source .zshrc in terminal when saving it

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

" Whitespace enabled by default
let g:better_whitespace_verbosity=1
"let b:better_whitespace_enabled=1
"autocmd BufReadPre,FileReadPre * EnableWhitespace

" Colored statusline in insert mode
au InsertEnter * hi StatusLine guibg=#0B4C5F
au InsertLeave * hi StatusLine guibg=#0A1B2A

" Disable tabs with cmd tabo wich will open all buffers in same tab
"autocmd BufWinEnter,BufNewFile * silent tabo

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

" resize windows
" map _ <C-W>-
" map + <C-W>+
" map <C-=> <C-W><
" map <C--> <C-W>>
" noremap <C-h> :vertical resize -1<CR>
" noremap <C-l> :vertical resize +1<CR>
"
" map <C-H> <C-w>h<C-w>\|
" map <C-L> <C-w>l<C-w>\|
"
" " resize current buffer by +/- 5
" nnoremap <S-left> :vertical resize -5<cr>
" nnoremap <S-down> :resize +5<cr>
" nnoremap <S-up> :resize -5<cr>
" nnoremap <S-right> :vertical resize +5<cr>
"
" Splits
" <C-H> vsplit r
" <C-L> vsplit L
map <C-J> <C-W>j<C-w>_
map <C-K> <C-W>k<C-W>_
"set winminwidth=0
"map <C-L> <C-W>h<C-W>|
"map <C-H> <C-W>l<C-W>|
" <C-W> =

" @TODO alt map
" Switch splits mappings /*{{{*/
" nnoremap <C-=> :normal <c-r>=SwitchWindow('+')<CR><CR>
" nnoremap <C--> :normal <c-r>=SwitchWindow('-')<CR><CR>
" nnoremap <C-H> :normal <c-r>=SwitchWindow('<')<CR><CR>
" nnoremap <C-L> :normal <c-r>=SwitchWindow('>')<CR><CR>
"
" function! SwitchWindow(dir)
"   let this = winnr()
"   if '+' == a:dir
"     execute "normal \<c-w>k"
"     elseif '-' == a:dir
"     execute "normal \<c-w>j"
"     elseif '>' == a:dir
"     execute "normal \<c-w>l"
"     elseif '<' == a:dir
"     execute "normal \<c-w>h"
"   else
"     echo "oops. check your ~/.vimrc"
"     return ""
"   endif
" endfunction
" /*}}}*/

"-------------------------- Tabs ---------------------------"

" This is for opening new tabs or
" switching between tabs {
    nnoremap <C-t> :tabnew<CR>
    "@TODO ctrl t in insert mode not working in linux nor mac
    inoremap <C-t> <Esc>:tabnew<CR>i
	execute "nnoremap " . altleft . " :tabprevious<CR>"
	execute "nnoremap " . altright . " :tabnext<CR>"
    "@TODO alt left / right not working in linux only
	execute "inoremap " . altleft . " <Esc>:tabprevious<CR>i"
	execute "inoremap " . altright . " <Esc>:tabnext<CR>i"
"}

" ctrl-I to switch between vertical or
" horizontal splitted windows {
    map <C-I> <C-W><C-W>
"}

" vim explorer {
  "map <F4> :!ls<CR>:e
"}

"-------------------------- Help ---------------------------"

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

" Modes
" n	Normal mode
" v	Visual mode
" ve	Visual mode with 'selection' "exclusive" (same as 'v',
"     if not specified)
" o	Operator-pending mode
" i	Insert mode
" r	Replace mode
" c	Command-line Normal (append) mode
" ci	Command-line Insert mode
" cr	Command-line Replace mode
" sm	showmatch in Insert mode
" a	all modes

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

" Relative path of script file:
"let s:path = expand('<sfile>')

" Absolute path of script file:
"let s:path = expand('<sfile>:p')

" Absolute path of script file with symbolic links resolved:
"let s:path = resolve(expand('<sfile>:p'))

" Folder in which script resides: (not safe for symlinks)
"let s:path = expand('<sfile>:p:h')

" If you're using a symlink to your script, but your resources are in
" the same directory as the actual script, you'll need to do this:
"   1: Get the absolute path of the script
"   2: Resolve all symbolic links
"   3: Get the folder of the resolved absolute file
"let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Use MacVim to edit Git commit messages
" Add the following line to the file ~/.profile:
" export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

" Force MacVim to use my shell PATH?
" The problem is that MacOS uses zshenv incorrectly, forcing system paths for non-login shell calls. This can be fixed by moving zshenv to zprofile:
" sudo mv /etc/zshenv /etc/zprofile

" Auto source file in var
"autocmd BufWritePost *vimrc execute "source " . expand("<afile>")

" Execute cmd in every buffer
" bufdo execute "normal! @a" | update

" Check if a split buffer already exists
"let bnr = bufwinnr(expand("%")) | if bnr > 0

" command! -range Linediff      call linediff#Linediff(<line1>, <line2>)
" command! -bang  LinediffReset call linediff#LinediffReset(<q-bang>)

"-------------------------- Cheatsheet ---------------------------"

"							http://bencrowder.net/files/vim-fu/
" Function key + up /down   Scroll page up / down
" Function key + L / R      Begin / End of line
" Ctrl + L / R              Switch desktops
" Alt + L /R                Switch tabs
" cmd
" Shift + up /down          Move 10lines up / down
" Shift + / -               Split + /-

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
" Ctrl wo                   fullscreen current buffer
" w / b                     word /back
" f + char                  find char
" ci + char                 change inside
"
" 							Vim Vinegar
"
" :Sex                      open netrw in horisontal split
" Vex                       open netrw in vertical split
" %                         New file
" d                         New directory
" R                         Rename
" s                         Change sort
" . file                    Delete file

" Visual mode highlight
" :highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
