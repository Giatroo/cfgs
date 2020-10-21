""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Font and text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Seta a fonte para Courier New
" set guifont=Courier\ New

" Habilita o highlight de sintaxe
syntax on

" Limita a quantidade de caracteres por linha para 80
set textwidth=80

" Coloca uma indicação visual da coluna limite para a linha
set colorcolumn=80

" Faz com que o tab seja equivalente a quatro barras de espaço
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Aceita caracteres utf-8
set encoding=utf-8

" Faz com que o enconding seja escrito no arquivo
" set fileencoding=uft-8

" Converte de tab para espaços
set expandtab

" Identa algumas coisas para você
set smartindent

" Auto identação
set autoindent

" Se o texto passar da tela, ele pula para a linha de baixo
set wrap

" Dá um highlight na linha do cursor
" set cursorline


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Barra de espaço é a tecla lider
let mapleader="\<space>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Other keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl + n -> vai para o próximo buffer
nnoremap <C-n> :bnext<CR>
" Ctrl + p -> vai parar o anterior
nnoremap <C-p> :bprevious<CR>
" Ctrl + b -> mostra os buffers abertos
nnoremap <C-b> :buffers<CR>

" Alt + hjkl -> resize nas janelas
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Ctrl + hkjl -> naveja pelas janelas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Identar continua no modo visual
vnoremap < <gv
vnoremap > >gv

" esc com jk no modo insert e visual
inoremap jk <Esc>
inoremap kj <Esc>
" vnoremap jk <Esc>
" vnoremap kj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ativa o número das linhas na esquerda
set number

" Faz com que os números de linha sejam relativos a onde o cursor está
set relativenumber

" Habilita o mouse no Vim de terminal
set mouse=a

" Busca incremental (mostra em tempo real o que você busca)
set incsearch

" Deixa todos os matchs de uma busca em highlight
set hlsearch

" Splits horrizontais vão ser para baixo
set splitbelow

" Splits verticais vão ser para a direita
set splitright

" Remove espaços após o final das linhas ao salvar
autocmd BufWritePre * %s/\s\+$//e

let g:python_host_prog = '/usr/bin/python3.8'
let g:python3_host_prog = '/usr/bin/python3.8'
