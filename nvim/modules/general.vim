""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Font and text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Now vim can highlight the text based on its extension
syntax on

" Limits the amoung of chars a line can have to 80 (that's a good standart)
set textwidth=80

" Visual indication of the 80 chars
set colorcolumn=81

" Inside git commit files, we want the textwidth to be 72 chars
autocmd Filetype gitcommit setlocal spell textwidth=72

" Make tab equal to 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Converts tabs into spaces
set expandtab

" Set the encoding to utf-8, for compatibility.
set encoding=utf-8

" Indents some text for you
set smartindent
set autoindent

" If you're typing goes beyond `textwidth` it wraps the line automatically
set wrap

" Highlights the cursor line
set cursorline

" Automatic folds by indentation (but not automatically when I open a buffer)
set foldmethod=indent
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Space is the leader key
let mapleader="\<space>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Other keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl + n -> go to the next buffer
nnoremap <C-n> :bnext<CR>
" Ctrl + p -> go to the previous buffer
nnoremap <C-p> :bprevious<CR>
" Ctrl + b -> show all the open buffers
nnoremap <C-b> :buffers<CR>

" Alt + hjkl -> resize the splits
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Ctrl + hkjl -> navigate through the splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Persistend indentention inside visual mode
vnoremap < <gv
vnoremap > >gv

" Inside normal mode, type j and k fast to go to normal mode
inoremap jk <Esc>
inoremap kj <Esc>
" vnoremap jk <Esc>
" vnoremap kj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers on the left
set number

" Show line number on the left relatively to my current line
set relativenumber

" Enable mouse
set mouse=a

" Show in real time what I'm searching for
set incsearch

" Show search matches in highlight
set hlsearch

" Horizontal splits go below current split
set splitbelow

" Vertical splits go to the right of the current split
set splitright

" Remove spaces at the end of the line when saving
autocmd BufWritePre * %s/\s\+$//e

" Set python usage (some plugins may need)
let g:python_host_prog = '/usr/bin/python3.8'
let g:python3_host_prog = '/usr/bin/python3.8'
