setlocal colorcolumn=80
setlocal complete+=s
setlocal formatoptions=1
setlocal formatprg=/home/bcmyers/target/release/parust
setlocal linebreak
setlocal noexpandtab
setlocal wrap
" setlocal spell spelllang=en_us
" setlocal thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt

nnoremap <silent> Q gqap
xnoremap <silent> Q gq
nnoremap <silent> <leader>Q vapJgqap

" if !exists('*s:setupWrapping')
"   function s:setupWrapping()
"     set wrap
"     set wm=2
"     set textwidth=79
"   endfunction
" endif
" augroup vimrc-txt
"   autocmd!
"   autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
" augroup END

