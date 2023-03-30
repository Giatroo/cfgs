" Prevent from messing up my whichkey menu
let g:gitgutter_map_keys = 0

" We need now to bind it manually
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

let g:which_key_map.g = {'name' : '+git'}

nmap <leader>gi <Plug>(GitGutterPreviewHunk)
let g:which_key_map.g.i = 'Hunk info'

nmap <leader>gu <Plug>(GitGutterUndoHunk)
let g:which_key_map.g.u = 'Undo hunk'

nmap <leader>gs <Plug>(GitGutterStageHunk)
let g:which_key_map.g.s = 'Hunk stage'

function ToggleChangesView()
      if !exists("b:toggle_changes_view_flag")
            let b:toggle_changes_view_flag = 1
      endif

      if b:toggle_changes_view_flag == 1
            GitGutterFold
      else
            normal zR
      endif

      GitGutterLineHighlightsToggle
      GitGutterLineNrHighlightsToggle

      if b:toggle_changes_view_flag == 1
            let b:toggle_changes_view_flag = 0
      else
            let b:toggle_changes_view_flag = 1
      endif
endfunction


nmap <leader>gf :call ToggleChangesView()<cr>
let g:which_key_map.g.f = 'Fold unchanges'

nmap <leader>gr :GitGutterAll<cr>
let g:which_key_map.g.r = 'Reload plug'
