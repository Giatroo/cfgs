colorscheme onedark

" Enables true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:onedark_termcolors="256"
let g:onedark_terminal_italics="1"

let g:lightline = {
   \ 'colorscheme': 'onedark',
   \ }
