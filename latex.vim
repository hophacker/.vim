"{{{latex tex
Plugin 'latex-support.vim'
Plugin 'jcf/vim-latex'
augroup filetype_tex
    autocmd!
    autocmd FileType tex nnoremap <leader>cp :execute "!cp %:r.pdf  ~/Desktop/resume.pdf -f"<cr>
    autocmd FileType tex nnoremap <F9> :SCCompile<cr>
    autocmd FileType tex nnoremap <F10> :SCCompileRun<cr>
    autocmd FileType tex nnoremap <F7> :execute "set ft=text"<cr>
    autocmd FileType tex set textwidth=120
    autocmd FileType tex nnoremap <F6> :execute "!evince " . expand('%:r').".pdf &" <cr>
    autocmd FileType tex nnoremap <F8> g<C-g>
augroup END
"}}}
