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

" Converte de tab para espaços
set expandtab

" Identa algumas coisas para você
set smartindent

" Se o texto passar da tela, ele pula para a linha de baixo
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Barra de espaço é a tecla lider
let mapleader="\<space>"

" Espaço + ; -> coloca ; no final da linha
nnoremap <leader>; A;<esc>

" Espaço + y + y -> copia todo o arquivo para o clipboard
nnoremap <leader>yy gg"+yG

" Espaço + d + d -> recorda todo o arquivo para o clipboard
nnoremap <leader>dd gg"+dG

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

" Remove espaços após o final das linhas ao salvar
autocmd BufWritePre * %s/\s\+$//e
