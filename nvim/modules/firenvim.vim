if exists('g:started_by_firenvim')
      imap <cr> <esc>:wq<cr>
      map <cr> <esc>:wq<cr>
      let g:airline#extensions#tabline#enabled = 0
      let g:airline_disable_statusline = 1
      set laststatus=0
      set showmode
      set guifont=Lucida_Console:h11
      autocmd BufWinEnter,WinEnter * startinsert
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
let fc['https://meet.google.com'] = { 'takeover': 'never', 'priority': 1 }
