""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
""""" Plugins principais:
    " VSCode no Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Status line
    Plug 'itchyny/lightline.vim'

    " Toggle de comentários
    Plug 'preservim/nerdcommenter'

    " Usar teclas do vim (d, c, y) com delimitadores
    Plug 'tpope/vim-surround'

    " Plugin para LaTeX
    Plug 'lervag/vimtex'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'


""""" Para sintaxe:
    " Rainbow parentheses
    Plug 'luochen1990/rainbow'

    " clang-format para o vim (formatter para a familia C)
    Plug 'rhysd/vim-clang-format'

    " Melhor syntax highlight
    Plug 'sheerun/vim-polyglot'

""""" misc:
    " Useful with f and t commands
    Plug 'unblevable/quick-scope'

    " Ajuda com a leader key
    Plug 'liuchengxu/vim-which-key'


""""" temporários:
    " Plugin para o racket
    Plug 'wlangstroth/vim-racket'
    Plug 'vim-syntastic/syntastic'

""""" temas:
    Plug 'morhetz/gruvbox'
    Plug 'shinchu/lightline-gruvbox.vim'

""""" Não usados mais:
    " Arvore de diretórios
    " Plug 'preservim/nerdtree'

call plug#end()
