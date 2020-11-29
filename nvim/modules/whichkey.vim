nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


" Create a map to add keys to
let g:which_key_map = {}
" Define a separator
let g:which_key_sep = '→'

" Important!
" This should be sourced before each plugin that maps something in the leader.
" Then we can add the mappings in each file of each specific plugin.

" Time for the window to open
" (This is also the time for many other things to timeout,
" so be careful)
set timeoutlen=500

" Change the colors
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function


" Now we need to add manually all the leader mappings
" (we'll do that in each specific plugin)

" Some general mappings:

" Space + ; -> adds a semicolumn at the end of the line
nnoremap <leader>; A;<esc>
let g:which_key_map[';'] = [ 'A;', 'Adds ;']

" Space + y + y -> yanks the whole file to the clipboard
nnoremap <leader>y gg"+yG
let g:which_key_map['y'] = [ 'gg"+yG', 'Yanks file']

" Space + d + d -> cuts the whole file to the clipboard
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
