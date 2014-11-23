Plugin 'vim-scripts/pydoc.vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'nvie/vim-pyunit'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
augroup filetype_python
    autocmd!
    "autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python nnoremap <F12> :execute "!./" .  expand("%") <CR>
    autocmd FileType python setlocal foldlevel=99
    autocmd FileType python setlocal statusline=%f-%y-[%l]/[%L]
    autocmd FileType python nnoremap <buffer> <localleader>c I#cesc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
augroup END
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=99
let g:flake8_max_complexity=10
autocmd BufWritePost *.py call Flake8()
"let g:flake8_cmd="/opt/strangebin/flake8000"