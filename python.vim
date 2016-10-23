Plug 'vim-scripts/pydoc.vim'
Plug 'alfredodeza/pytest.vim'
Plug 'klen/python-mode', { 'for': ['python'] }
"Python-mode{{{
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"
let g:pymode_lint_ignore = "W0611"
"}}}
Plug 'nvie/vim-flake8'
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
" autocmd BufWritePost *.py call Flake8()
"let g:flake8_cmd="/opt/strangebin/flake8000"
