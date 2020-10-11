"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==:> Folding text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Para os comandos abaixo funcionarem, precisamos criar a pasta ~/.vim/view/
" autocmd BufWinLeave *.* mkview              " Salva as folds do arquivo quando saímos dele
" autocmd BufWinEnter *.* silent loadview     " Abre o arquivo com as folds que criamos

" Lembrete sobre as teclas:
" V -> vai para o Line Visual Mode (para selecionar as linhas da fold que vamos criar)
" zf (no Visual Mode) -> cria uma fold das linhas selecionadas
" zf(movement) -> cria uma fold usando o movimento passado (e.g., zfa{ )
" zc -> fecha a fold
" zo -> abre a fold
" zO -> abre todas as nested folds
" zC -> fecha todas as nested folds
" zd -> deleta a fold
" zj -> move para a próxima fold (abaixo)
" zk -> move para a fold anterior (acima)
" [z -> move para o topo da fold atual
" ]z -> move para o fim da fold atual
" zR -> abre todas as folds
" zM -> fecha todas as folds
" zn -> desliga o modo fold
" zN -> liga o modo fold
" zE -> elimite todas as folds do documento

