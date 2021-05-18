""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> COC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ctrl+Espaço faz com que chame o autocompletar (apenas no INSERT MODE)
inoremap <silent><expr> <c-space> coc#refresh()

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
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

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

function! MyFormatFunction()
  let types = ['c', 'cpp', 'cs', 'java', 'js']
  let flag = 0
  for t in types
    if &filetype == t
      let flag = 1
    endif
  endfor

  if flag == 1
    :ClangFormat
    echo "Formated with clang-format"
  else
    :call CocAction('format')
  endif
endfunction


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call MyFormatFunction()

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ===========
" coc-explore
" ===========
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" ============
" Key mappings
" ============

let g:which_key_map.r = {'name' : '+coc'}

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
let g:which_key_map.r.n = 'Rename word'

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rd <Plug>(coc-definition)
nmap <leader>ry <Plug>(coc-type-definition)
nmap <leader>ri <Plug>(coc-implementation)
nmap <leader>rr <Plug>(coc-references)
let g:which_key_map.r.d = 'GoTo definition'
let g:which_key_map.r.y = 'GoTo type definition'
let g:which_key_map.r.i = 'GoTo implementation'
let g:which_key_map.r.r = 'GoTo references'

nnoremap <leader>f :Format<CR>
let g:which_key_map['f'] = [ ':Format'  , 'Format' ]

nnoremap <leader>n :CocCommand explorer<CR>
let g:which_key_map['n'] = [ ':CocCommand explorer'  , 'Explorer' ]

" =======
" coc-git
" =======

" let g:which_key_map.r.g = {'name' : '+git'}

" nmap ]c <Plug>(coc-git-nextchunk)
" nmap [c <Plug>(coc-git-prevchunk)
" nmap <leader>rgc <Plug>(coc-git-chunkinfo)
" let g:which_key_map.r.g.c = 'Chuck info'
" nmap <leader>rgf :CocCommand git.foldUnchanged<CR>
" let g:which_key_map.r.g.f = 'Fold unchanged'

" ============
" coc-snippets
" ============

" imap <C-l> <Plug>(coc-snippets-expand)

" let g:coc_snippet_next = '<c-l>'
" let g:coc_snippet_prev = '<c-k>'

" =================
" coc-spell-checker
" =================

nmap <leader>rs <Plug>(coc-codeaction-selected)
let g:which_key_map.r.s = 'Suggest word'

" ============================
" Reminders for my future self
" ============================
"
" :CocList extensions -> show available extensions
" :CocInstall <extensão> -> install one or more extension
" :CocUnistall <extensão> -> unistall
" :CocUpdate / :CocUpadateSync -> update extensions
"
" Coc extensions I use:
" coc-snippets
" coc-prettier
" coc-pairs
" coc-explorer
" coc-vimtex
" coc-tsserver
" coc-texlab
" coc-sql
" coc-sh
" coc-rome
" coc-markdownlint
" coc-jedi
" coc-json
" coc-html
" coc-css
" coc-clangd
" coc-fzf-preview
" coc-tabnine
" coc-spell-checker
" coc-highlight
" coc-cspell-dicts
