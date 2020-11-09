nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


" Create a map to add keys to
let g:which_key_map = {}
" Define a separator
let g:which_key_sep = '→'

" Important!
" This should be sourced before each plugin that maps something in the leader.
" Then we can add the mapings in each file of each specific plugin.

" Time for the window to open
" (This is also the time for many other things to timeout,
" so be careful)
set timeoutlen=500

" Change the colors
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function


" Now we need to add manually all the leader mapings
" (we'll do that in each specific plugin)

" Some general mapings:

" Espaço + ; -> coloca ; no final da linha
nnoremap <leader>; A;<esc>
let g:which_key_map[';'] = [ 'A;', 'Adds ;']

" Espaço + y + y -> copia todo o arquivo para o clipboard
nnoremap <leader>y gg"+yG
let g:which_key_map['y'] = [ 'gg"+yG', 'Yankes file']

" Espaço + d + d -> recorda todo o arquivo para o clipboard
nnoremap <leader>d gg"+dG
let g:which_key_map['d'] = [ 'gg"+dG', 'Cuts file']

nnoremap <leader>v :vsplit<CR>
let g:which_key_map['v'] = [ ':vsplit', 'Split right']

nnoremap <leader>h :split<CR>
let g:which_key_map['h'] = [ ':split', 'Split below']


let g:which_key_map.v = {
	\ 'name' : '+vimcmds',
	\ 'n' : [':set number!', 'Toggle number'],
	\ 'r' : [':set relativenumber!', 'Toggle relativenumber'],
	\ 'b' : [':buffers', 'Show buffers'],
  \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
