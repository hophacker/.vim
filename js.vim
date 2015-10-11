"indentation
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'sleistner/vim-jshint'
"Plugin 'walm/jshint.vim'
"Plugin 'wookiehangover/jshint.vim'
let g:JSHintHighlightErrorLine = 1
Plugin 'marijnh/tern_for_vim'
Plugin 'jQuery'
Plugin 'moll/vim-node'
"jshint2
Plugin 'Shutnik/jshint2.vim'
let jshint2_read = 0
let jshint2_save = 1
let jshint2_close = 0
let jshint2_confirm = 0
let jshint2_color = 1
let jshint2_height = 2
":JSHint {file}
"o to open in new window
"go to preview file (open but maintain focus on jshint results)
"q to close the quickfix window
"jslint
"Plugin 'hallettj/jslint.vim'
":JSLintUpdate
":JSLintToggle
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
