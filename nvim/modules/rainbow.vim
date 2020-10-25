let g:rainbow_active = 1

autocmd BufEnter * RainbowToggleOff
autocmd BufEnter *.rkt RainbowToggleOn
autocmd BufWritePost * RainbowToggleOff
autocmd BufWritePost *.rkt RainbowToggleOn
