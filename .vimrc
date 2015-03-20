let mapleader = ","
let maplocalleader = ","

execute pathogen#infect()

syntax on

set number
set numberwidth=5
set incsearch

filetyp plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set showmatch
set hlsearch

"Highlight current line
set cursorline
set cmdheight=2

syntax enable
:set t_Co=256
set background=light
colorscheme solarized

set foldmethod=syntax
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

imap <leader> <c-y>,
vmap <c-w> <c-y>,

"Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

set autoindent
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a different background color on gutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight clear SignColumn 
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTI PURSOPSE TAB KEY
" Indent if we are at the begining of a line, else, do completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   RENAME CURRENT FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function RenameFile()
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

