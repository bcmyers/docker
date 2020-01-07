autocmd BufWritePre *.py :silent execute ':Black'

setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with
setlocal colorcolumn=80
setlocal expandtab
setlocal formatoptions+=croq
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
