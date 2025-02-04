"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Font and text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set guifont=Courier\ New     " Seta a fonte para Courier New
syntax on                    " Habilita o highlight de sintaxe
set textwidth=80            " Limita a quantidade de characters por linha para 80
set colorcolumn=80          " Coloca uma indicação visual da coluna limit para a linha
set tabstop=4                " Faz com que o tab seja equivalente a duas barras de espaço
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set expandtab                " Converte de tab para espaços
set smartindent              " Identa algumas coisas para você
set wrap                     " Se o texto passar da tela, ele pula para a linha de baixo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<space>"       " Barra de espaço é a tecla lider
    " Espaço + ;                 coloca ; no final da linha
nnoremap <leader>; A;<esc>

    " Espaço + y + y             copia todo o arquivo para o clipboard
nnoremap <leader>yy gg"+yG

    " Espaço + d + d            recorda todo o arquivo para o clipboard
nnoremap <leader>dd gg"+dG

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                        " Ativa o número das linhas na esquerda
set relativenumber                " Faz com que os números de linha sejam relativos a onde o cursor está
set mouse=a                       " Habilita o mouse no Vim de terminal
set incsearch                     " Busca incremental (mostra em tempo real o que você busca)
set hlsearch                      " Deixa todos os matches de uma busca em highlight

autocmd BufWritePre * %s/\s\+$//e " Remove espaços após o final das linhas

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
 Plug 'preservim/nerdtree'                                    " Arvore de diretórios
 Plug 'preservim/nerdcommenter'                               " Toggle de comentários com Ctrl /
 Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }      " Autocompletar
 Plug 'neoclide/coc.nvim', {'branch': 'release'}              " VSCode no Vim
 Plug 'itchyny/lightline.vim'                                 " Status line
 Plug 'morhetz/gruvbox'                                       " colorscheme
 Plug 'shinchu/lightline-gruvbox.vim'                         " Um plugin para juntar os dois outros
 Plug 'davidhalter/jedi-vim'                                  " Um autocomplete para Python
 Plug 'wlangstroth/vim-racket'                                " Racket plugin
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Espaço + n                  abre/fecha a árvore de diretórios
nnoremap <leader>n :NERDTreeToggle<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl+Espaço faz com que chame o autocompletar (apenas no INSERT MODE)
" inoremap <silent><expr> <c-space> coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

    " Tab navega pelo autocompletar e Shift+Tab navega para cima
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " Após negavar, ENTER faz o autocompletar
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

    " Define F12 para ir para a definição de onde o cursor está
nnoremap <F12> gd

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Espaço+f formata
nnoremap <leader>f <esc>:Format<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gruvbox
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax enable
" set background=dark
" colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> LightLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:lightline = {
    " \ 'colorscheme': 'solarized',
    " \ }

set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> lightline-gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> NerdCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

let g:NERDSpaceDelims = 1                               " Coloca um espaço entre o comentário e o código
let g:NERDCommentEmptyLines = 0                         " Não deixa comentários em linhas vazias
let g:NERDTrimTrailingWhitespace = 1                    " Remove espaços em branco na direita quando descomenta

" <leader>c<space> é a tecla padrão
