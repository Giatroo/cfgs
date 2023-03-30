"------------------------------------------------------------------------------
" slime configuration
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------

let g:which_key_map.p = { 'name' : '+ipython' }

" map <Leader>ps to start IPython
let g:which_key_map.p.s = [ ':SlimeSend1 ipython --matplotlib', 'Start']

" map <Leader>pr to run script
nnoremap <Leader>pr :IPythonCellRun<CR>
let g:which_key_map.p.r = [ ':IPythonCellRun', 'Run script']

" map <Leader>pR to run script and time the execution
nnoremap <Leader>pR :IPythonCellRunTime<CR>
let g:which_key_map.p.R = [ ':IPythonCellRunTime', 'Run script time']

" map <Leader>pc to execute the current cell
nnoremap <Leader>pc :IPythonCellExecuteCell<CR>
let g:which_key_map.p.c = [ ':IPythonCellExecuteCell', 'Run cell']

" map <Leader>pC to execute the current cell and jump to the next cell
nnoremap <Leader>pC :IPythonCellExecuteCellJump<CR>
let g:which_key_map.p.C = [ ':IPythonCellExecuteCellJump', 'Run cell jump']

" map <Leader>pl to clear IPython screen
nnoremap <Leader>pl :IPythonCellClear<CR>
let g:which_key_map.p.l = [ ':IPythonCellClear', 'Clear screen']

" map <Leader>px to close all Matplotlib figure windows
nnoremap <Leader>px :IPythonCellClose<CR>
let g:which_key_map.p.x = [ ':IPythonCellClose', 'Close matplotlib']

" map [s and ]s to jump to the previous and next cell header
nnoremap [s :IPythonCellPrevCell<CR>
nnoremap ]s :IPythonCellNextCell<CR>

" map <Leader>ph to send the current line or current selection to IPython
nmap <Leader>ph <Plug>SlimeLineSend
xmap <Leader>ph <Plug>SlimeRegionSend
let g:which_key_map.p.h = 'Send line'

" map <Leader>pp to run the previous command
nnoremap <Leader>pp :IPythonCellPrevCommand<CR>
let g:which_key_map.p.p = [ ':IPythonCellPrevCommand', 'Run prev cmd']

" map <Leader>pQ to restart ipython
nnoremap <Leader>pQ :IPythonCellRestart<CR>
let g:which_key_map.p.Q = [ ':IPythonCellRestart', 'Restart']

" map <Leader>pn to create a new IPython cell
function NewCell()
      execute "normal! o\<esc>o\<esc>0i# %% New ipython cell ================\<cr>\<cr>"
endfunction

nnoremap <Leader>pn :call NewCell()<CR>
let g:which_key_map.p.n = [ ':call NewCell()', 'New cell']

" map <Leader>pN to run the current cell and create one below
function RunAndNew()
      call IPythonCellExecuteCell(0, 1)
      call NewCell()
endfunction
let g:which_key_map.p.N = [ ':call RunAndNew()', 'Run and new cell']

