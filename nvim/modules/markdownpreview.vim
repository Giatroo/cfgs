" Autostarts when enter a *.mb buffer
let g:mkdp_auto_start = 0
" Autocloses when leave a *.mb buffer
let g:mkdp_auto_close = 1

" let g:mkdp_browser = '/bin/google-chrome/'
let g:mkdp_command_for_global = 1

nmap <leader>m <Plug>MarkdownPreview
let g:which_key_map.m = "Markdown"
