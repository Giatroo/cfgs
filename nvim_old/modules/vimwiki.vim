" required
set nocompatible

" Changing wiki dir
let g:vimwiki_list = [{'path' : '~/vimwiki/',
                    \ 'syntax' : 'markdown', 'ext' : '.md'}]


" Setting up which key for vimwiki
let g:which_key_map.w = { 'name' : '+wiki'}
let g:which_key_map.w.w = 'Open'
let g:which_key_map.w.t = 'Split open'
let g:which_key_map.w.s = "Select and open"
let g:which_key_map.w.d = "Delete cur wiki file"
let g:which_key_map.w.r = "Rename cur wiki file"

" Remove the tab bind in insert mode
let g:vimwiki_key_mappings = {
  \   'all_maps': 1,
  \   'global': 1,
  \   'headers': 1,
  \   'text_objs': 1,
  \   'table_format': 1,
  \   'table_mappings': 0,
  \   'lists': 1,
  \   'links': 1,
  \   'html': 1,
  \   'mouse': 0,
  \ }

