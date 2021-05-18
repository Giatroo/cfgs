nmap <leader>t :TagbarToggle<CR>
let g:which_key_map.t = 'Tag menu'

" Move the cursor to the tag window when open it
let g:tagbar_autofocus = 1

" Leave the tags in the same order as they're in the file
let g:tagbar_sort = 0

" Compact mode
let g:tagbar_compact = 1

" Remove the symbols +, # and - (for public, protected and private)
let g:tagbar_show_visibility = 0

" Shows the tag count next to the tag kind
let g:tagbar_show_tag_count = 1
