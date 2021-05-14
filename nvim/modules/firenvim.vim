if exists('g:started_by_firenvim')
      imap <cr> <esc>:wq<cr>
      map <cr> <esc>:wq<cr>
      let g:airline#extensions#tabline#enabled = 0
      let g:airline_disable_statusline = 1
      set laststatus=0
      set showmode
      set guifont=Lucida_Console:h11
      set textwidth=0
      autocmd BufWinEnter,WinEnter * startinsert
      autocmd BufEnter www.kaggle.com_*.txt set filetype=markdown
      autocmd BufEnter kkb-production.jupyter-proxy.kaggle.net_*.txt set filetype=python
endif

let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://translate.google.com.br'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://meet.google.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['http://localhost:8888'] = { 'takeover': 'never', 'priority': 1 }
let fc['http://localhost:8889'] = { 'takeover': 'never', 'priority': 1 }
" let fc['**coursera.org.*'] = {'takeover': 'never', 'priority' : 99}
" let fc['**trello.com.*'] = { 'takeover': 'never', 'priority': 99 }
" let fc['**kaggle.com.*'] = { 'takeover': 'never', 'priority': 99 }
