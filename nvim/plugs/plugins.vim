    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

    " Arvore de diretórios
    Plug 'preservim/nerdtree'

    " Toggle de comentários
    Plug 'preservim/nerdcommenter'

    " Autocompletar
    " Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

    " VSCode no Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Status line
    Plug 'itchyny/lightline.vim'

    " Um tema
    Plug 'morhetz/gruvbox'

    " Um plugin para juntar os dois outros
    Plug 'shinchu/lightline-gruvbox.vim'

    " Plugin para LaTeX
    Plug 'lervag/vimtex'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

call plug#end()
