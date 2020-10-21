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
" Key mapings
" ===========

let g:which_key_map.r = { 'name' : '+coc'}

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
let g:which_key_map.r.n = 'Rename word'

" GoTo code navigation.
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

" Define F12 para ir para a definição de onde o cursor está
nnoremap <F12> gd

" Espaço+f formata
nnoremap <leader>f :Format<CR>
let g:which_key_map['f'] = [ ':Format'  , 'Format' ]

nnoremap <leader>n :CocCommand explorer<CR>
let g:which_key_map['n'] = [ ':CocCommand explorer'  , 'Explorer' ]

" ============
" coc-snippets
" ============

" imap <C-l> <Plug>(coc-snippets-expand)

" let g:coc_snippet_next = '<c-l>'
" let g:coc_snippet_prev = '<c-k>'

" Reminders para o eu do futuro:
    " :CocList extensions -> mostra todas as extensões disponíveis
    " :CocInstall <extensão> -> instala uma extensão (ou mais de uma)
    " :CocUnistall <extensão> -> desinstala
    " :CocUpdade / :CocUpadateSync -> atualiza as extensões
