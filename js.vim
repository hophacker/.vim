"indentation
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'moll/vim-node'
Plugin 'hophacker/tagman.vim'
"jshint2
Plugin 'Shutnik/jshint2.vim'
"{{{vim-javascript
Plugin 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss = 0
let javascript_ignore_javaScriptdoc = 0
let g:javascript_conceal=0
let b:javascript_fold=1
"}}}
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END

nnoremap <silent> <leader>e :call JSFormat()<cr>

function! JSFormat()
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  let fileWorkingDirectory = expand('%:p:h')
  let currentWorkingDirectory = getcwd()
  execute ':lcd' . fileWorkingDirectory
  execute ':silent' . '%!esformatter'
  if v:shell_error
    undo
    "echo "esformatter error, using builtin vim formatter"
    " use internal formatting command
    execute ":silent normal! gg=G<cr>"
  endif
  " Clean up: restore previous search history, and cursor position
  execute ':lcd' . currentWorkingDirectory
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction
