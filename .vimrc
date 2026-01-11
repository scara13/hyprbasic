set ts=4 shiftwidth=4
set number
syntax on
set mouse=a

" Use spaces instead of tabs only for .rpy files
augroup renpy
    autocmd!
    autocmd BufRead,BufNewFile *.rpy setlocal expandtab
    autocmd BufRead,BufNewFile *.rpy setlocal tabstop=4
    autocmd BufRead,BufNewFile *.rpy setlocal shiftwidth=4
    autocmd BufRead,BufNewFile *.rpy setlocal softtabstop=4
augroup END
