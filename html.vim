Plug 'rstacruz/sparkup', {'rtp': 'vim/'} "writing html faster
Plug 'slim-template/vim-slim.git'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
augroup filetype_html
    autocmd!
    "autocmd FileType html setlocal indentkeys-=*<Return>
    autocmd BufWritePre,BufRead *.html setlocal nowrap
    autocmd FileType html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
    autocmd FileType html set sw=4
    autocmd FileType html iabbrev <buffer> --- &mdash;
    autocmd FileType html setlocal foldmethod=indent 
    autocmd FileType html iabbrev <buffer> `` &ldquo;
    autocmd FileType html iabbrev <buffer> '' &rdquo;
augroup END
let g:html_indent_inctags = "html,body,head,tbody"
