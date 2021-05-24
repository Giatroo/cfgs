call plug#begin('~/.vim/plugged')
""""" Main plugins
    " This plugin basically turns Vim into VSCode
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Status line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Tagbar
    Plug 'preservim/tagbar'

    " Fuzzing finder for vim
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " Commentary toggle
    Plug 'preservim/nerdcommenter'

    " Use vim keys (d, c, y) on delimiters (surrounds)
    Plug 'tpope/vim-surround'

    " LaTeX plugin
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

    " Ipython integration
    Plug 'jpalardy/vim-slime', { 'for': 'python' }
    Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

    " Python auto documentation
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

    " Nvim inside chrome
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    " Coding metrics
    Plug 'wakatime/vim-wakatime'


""""" Syntax
    " clang-format for vim (C family formatter)
    Plug 'rhysd/vim-clang-format'

    " Better syntax highlight
    Plug 'sheerun/vim-polyglot'


""""" Misc
    " Useful with f and t commands
    Plug 'unblevable/quick-scope'

    " This plugin helps a lot with leader key
    Plug 'liuchengxu/vim-which-key'

    " Dev icons
    Plug 'ryanoasis/vim-devicons'


""""" Temporary (nothing here for now)

""""" Themes
    " Plug 'morhetz/gruvbox'
    Plug 'shinchu/lightline-gruvbox.vim'

""""" Not used anymore
    " Directory tree (replaced by a CoC extension)
    " Plug 'preservim/nerdtree'

    " Vertical lines to indicate indentations
    " Plug 'Yggdroot/indentLine'

call plug#end()
