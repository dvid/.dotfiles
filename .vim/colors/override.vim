"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/gotham256.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "override"

"Clear the colors for any items that you don't like
"hi clear StatusLine
"hi clear StatusLineNC

"Set up your new & improved colors
"hi StatusLine guifg=black guibg=white
"hi StatusLineNC guifg=LightCyan guibg=blue gui=bold

highlight Identifier ctermfg=Green guifg=#006F00
highlight ExtraWhitespace ctermbg=Green
highlight Cursor guifg=#ffffff guibg=#d86020
highlight iCursor guifg=#ffffff guibg=#AAFF00

" Default state of cursor:
" n-v-c:block-Cursor/lCursor,
" ve:ver35-Cursor,
" o:hor50-Cursor,
" i-ci:ver25-Cursor/lCursor,
" r-cr:hor20-Cursor/lCursor
