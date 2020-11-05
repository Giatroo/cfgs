let g:fzf_preview_window = ['right:60%', 'ctrl-/']
let g:fzf_layout = { 'window': {'width': 0.9, 'height': 0.8 } }

nmap <leader>sf <ESC>:Files<CR>
nmap <leader>sb <ESC>:Buffers<CR>
nmap <leader>sl <ESC>:Lines<CR>
nmap <leader>sw <ESC>:Rg<CR>

let g:which_key_map.s = { 'name' : '+search'}
let g:which_key_map.s.f = 'Files'
let g:which_key_map.s.b = 'Buffers'
let g:which_key_map.s.l = 'Lines'
let g:which_key_map.s.w = 'Words'
