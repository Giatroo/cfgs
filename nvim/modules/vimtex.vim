" Space l c -> Toggles the autocompiler
nmap <Leader>lc :VimtexCompile<CR>

" Space l t o c -> Open the table of contents
nmap <Leader>lt :VimtexTocToggle<CR><C-h>

" Space l v -> Open the PDF
nmap <Leader>lv :VimtexView<CR>

" Space l m -> Shows the list of insert maps
nmap <Leader>lm :VimtexImapsList<CR>

let g:which_key_map.l = {
    \ 'name' : '+vimtex',
    \ 'c' : 'Compile',
    \ 'v' : 'View PDF',
    \ 'm' : 'Imaps List',
    \ 't' : 'Table of Contents'
  \ }


" Defines that the file .tex are LaTeX (not other tex flavor)
let g:tex_flavor = 'latex'
" Enables folding
let g:vimtex_fold_enabled=1
" Defines zathura as the pdf viewer
let g:vimtex_view_method='zathura'


" Clean the extra tex files automatically
autocmd BufWinLeave *.tex VimtexClean

" Turns the compiler on whenever enters a .tex file (unused)
" autocmd BufWinEnter *.tex VimtexCompile


"===============================================================================
"============================== CUSTOM SNIPPETS ================================
"===============================================================================

" In insert mode, hitting ; followed by some key combinations will toggle some
" snippets
let g:vimtex_imaps_leader=';'


" Adding new maps for insert mode
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
