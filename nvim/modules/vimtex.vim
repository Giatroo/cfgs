" Espaço l c -> Dá toggle no autocompilador
nmap <Leader>lc :VimtexCompile<CR>

" Espaço l t o c -> Abre a Table of Contents
nmap <Leader>lt :VimtexTocToggle<CR><C-h>

" Espaço l v -> Abre o PDF
nmap <Leader>lv :VimtexView<CR>

" Espaço l m -> Mostra a lista de maps no insert mode
nmap <Leader>lm :VimtexImapsList<CR>

let g:which_key_map.l = {
    \ 'name' : '+vimtex',
    \ 'c' : 'Compile',
    \ 'v' : 'View PDF',
    \ 'm' : 'Imaps List',
    \ 't' : 'Table of Contents'
  \ }


" Define que os arquivos .tex são latex (ao invés de outro flavor de tex)
let g:tex_flavor = 'latex'
" Ativa o folding do vimtex
let g:vimtex_fold_enabled=1
" Chama o zathura como pdf viewer
let g:vimtex_view_method='zathura'


" Dá um clean nos arquivos auxiliares automaticamente
autocmd BufWinLeave *.tex VimtexClean

" Liga o compilador quando entra em um arquivo .tex (ainda em teste)
" autocmd BufWinEnter *.tex VimtexCompile

" No modo insert, ao digitar ; seguido de outras teclas, ativam alguns
" snippets para o modo matemático
let g:vimtex_imaps_leader=';'


" Adicionando novos mapings no insert mode:
call vimtex#imaps#add_map({
    \ 'lhs' : '-',
    \ 'rhs' : '\inv',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})

call vimtex#imaps#add_map({
    \ 'lhs' : 'O',
    \ 'rhs' : '\Omega',
    \ 'wrapper' : 'vimtex#imaps#wrap_math'
    \})


call vimtex#imaps#add_map({
    \ 'lhs' : 'end',
    \ 'rhs' : 'Ender lindo',
    \ 'leader' : '!',
    \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
    \})


" =============
" Algumas teclas padrões
" =============
"
" ]] -> vai para a próxima seção ou capítulo
" [[ -> vai para a seção ou capítulo anterior
"
" F7 -> insere um novo comando
"
" e -> significa environment (die, dae, cie, yie, ...)
" c -> significa command (dic, dac, cic, yic, ...)
" $ -> significa inline math mode (di$, da$, ci$, yi$, ...)
" d -> significa delimiter (did, dad, cid, yid, ...)
" P -> significa section/chapter (diP, daP, ciP, yiP, ...)
" m -> significa item (dim, dam, cim, yim, ...)
"
" Também podemos usar os comandos acima mas com a tecla s de surrounding
" dsc, dse, ds$, dsd, csc, cse, cs$, csd
"
" Toggle surrounding delimiters:
    " tsd/tsD -> troca () por \left(\right) entre outros como [, \{ etc.
" Toggle surrounding fractions:
    " tsf -> troca 10/5 por \frac{10}{5}
" Toggle também funciona com command e environment
