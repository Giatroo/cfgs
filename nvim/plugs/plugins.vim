""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
""""" Plugins principais:
    " VSCode no Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Status line
    " Plug 'itchyny/lightline.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Fuzzing finder for vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " Toggle de comentários
    Plug 'preservim/nerdcommenter'

    " Usar teclas do vim (d, c, y) com delimitadores
    Plug 'tpope/vim-surround'

    " Plugin para LaTeX
    Plug 'lervag/vimtex'

    " Markdown plugins
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Personal wiki
    Plug 'vimwiki/vimwiki'

    " Git inside vim
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

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

    " Vertical lines to indicate indentations
    " Plug 'Yggdroot/indentLine'


""""" temporários:
    " Plugin para o racket
    Plug 'wlangstroth/vim-racket'

""""" temas:
    " Plug 'morhetz/gruvbox'
    Plug 'shinchu/lightline-gruvbox.vim'

""""" Não usados mais:
    " Arvore de diretórios
    " Plug 'preservim/nerdtree'

call plug#end()
