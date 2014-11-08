"Jie Feng's .vimrc, jiefeng.hopkins@gmail.com
"vundle begin{{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
"}}}
"edit .vimrc and refresh{{{
nnoremap <localleader>ia mzgg=G`z
nnoremap <localleader>rf :e<cr>
nnoremap <localleader>sv :source $MYVIMRC<cr>
nnoremap <localleader>ft :execute 'set ft=' . &filetype<cr>
nnoremap <localleader>s% :source %<cr>
"}}}
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim' " This library provides some utility functions
Plugin 'klen/rope-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'marcweber/vim-addon-manager'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
"{{{ultisnips
Plugin 'sirver/ultisnips'

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-x c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-x c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/VimLite'
Plugin 'L9' "provides some utility functions and commands for programming in Vim
"pathogen"{{{
Plugin 'tpope/vim-pathogen'
set laststatus=2
set nocp
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
"}}}
"{{{code completion, complete
Plugin 'Valloric/YouCompleteMe'
" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
"}}}
"{{{snipmate snippets
"Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateBack
smap <C-K> <Plug>snipMateBack
imap <C-L> <Plug>snipMateShow
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
"}}}
"scrooloose/nerdtree{{{
Plugin 'scrooloose/nerdtree'
map <localleader>n :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
"}}}
"{{{latex tex
Plugin 'latex-support.vim'
Plugin 'jcf/vim-latex'
augroup filetype_tex
    autocmd!
    autocmd FileType tex nnoremap <localleader>cp :execute "!cp %:r.pdf  ~/Desktop/resume.pdf -f"<cr>
    autocmd FileType tex nnoremap <F9> :SCCompile<cr>
    autocmd FileType tex nnoremap <F10> :SCCompileRun<cr>
    autocmd FileType tex nnoremap <F7> :execute "set ft=text"<cr>
    autocmd FileType tex set textwidth=120
    autocmd FileType tex nnoremap <F6> :execute "!evince " . expand('%:r').".pdf &" <cr>
    autocmd FileType tex nnoremap <F8> g<c-g>
augroup END
"}}}
"{{{ruby rails
Plugin 'tpope/vim-rails.git'
Plugin 'vim-ruby/vim-ruby'
augroup filetype_ruby
    autocmd!
    autocmd FileType ruby set sw=2
    autocmd FileType ruby nnoremap <F9> :execute "!ruby ./" .  expand("%") <CR>
    autocmd FileType ruby setlocal statusline=%f-%y-[%l]/[%L]
augroup END
augroup filetype_eruby
    autocmd!
    autocmd FileType eruby set foldmethod=indent
augroup END
"}}}
"{{{html haml slim
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} "writing html faster
Plugin 'slim-template/vim-slim.git'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'
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
"}}}
"{{{python
Plugin 'vim-scripts/pydoc.vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'nvie/vim-pyunit'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
"python filetype{{{
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
augroup END
"}}}
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=99
let g:flake8_max_complexity=10
autocmd BufWritePost *.py call Flake8()
"let g:flake8_cmd="/opt/strangebin/flake8000"
"}}}
"{{{ javascript nodejs
"indentation
Plugin 'nathanaelkane/vim-indent-guides'
"vim-javascript
    Plugin 'pangloss/vim-javascript'
    let javascript_enable_domhtmlcss = 0
    let javascript_ignore_javaScriptdoc = 0
    let g:javascript_conceal=0
    let b:javascript_fold=1
"Plugin 'sleistner/vim-jshint'
"Plugin 'walm/jshint.vim'
"Plugin 'wookiehangover/jshint.vim'
let g:JSHintHighlightErrorLine = 1
Plugin 'marijnh/tern_for_vim'
Plugin 'jQuery'
Plugin 'moll/vim-node'
"jshint2
    Plugin 'Shutnik/jshint2.vim'
    let jshint2_read = 1
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
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END
"}}}
"{{{c cpp D
Plugin 'Hackerpilot/DCD'
"c/cpp filetype{{{
augroup filetype_c_cpp
    autocmd!
    autocmd FileType *
                \	if ( &filetype == 'cpp' || &filetype == 'c') |
                \	    set nowrap |
                \	endif
augroup END
"}}}
"clang_complete{{{
Plugin 'Rip-Rip/clang_complete'
let g:clang_library_path = "/usr/lib/llvm-3.4/lib/"
let g:clang_library_file = "libclang.so.1"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'
let g:clang_complete_auto = 1

" Clang Complete Settings
let g:clang_use_library=1
let g:clang_debug = 1
" if there's an error, allow us to see it
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options=' -std=c++11 || exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
let g:clang_auto_select=2
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
"""}}}
"D language {{{
"let g:dcd_path=['/home/john/DCD/']
let g:dcd_importPath=['/home/john/programming/D/','/usr/include/dmd/druntime/import']
"}}}
"cvim{{{
Plugin 'git://github.com/hophacker/cvim'
let s:C_CFlags         				= ' -g -O0 -c'      " C compiler flags: compile, don't optimize
let s:C_LFlags         				= ' -g -O0'         " C compiler flags: link   , don't optimize
let s:C_CplusCFlags         	= '-std=c++11 -g -O0 -c -Wno-deprecated'      " C++ compiler flags: compile, don't optimize
let s:C_CplusLFlags         	= '-std=c++11 -g -O0 -Wno-deprecated'         " C++ compiler flags: link   , don't optimize
"}}}
"}}}
"{{{perl awk bash
Plugin 'vim-perl/vim-perl'
Plugin 'vim-scripts/awk.vim'
Plugin 'vim-scripts/bash-support.vim'
augroup filetype_perl
    autocmd!
    autocmd FileType perl noremap <F10> :!perl % <cr>
augroup END
"}}}
"{{{tagbar
Plugin 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>
"}}}
"{{{SingleCompile
Plugin 'xuhdev/SingleCompile'
nmap <F9> :SCCompile<cr> 
nmap <F10> :SCCompileRun<cr> 
"}}}
"taskList{{{
Plugin 'TaskList.vim'
map <localleader>td <Plug>TaskList
"}}}
"{{{git github markdown
Plugin 'tpope/vim-git'
"markdown{{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown set spell
    autocmd FileType markdown nnoremap <F8> :!./commit.sh<cr>
augroup END
"}}}
"}}}
"{{{code beautify
Plugin 'einars/js-beautify'
autocmd FileType javascript noremap <buffer>  <localleader>bb :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <localleader>bb :call HtmlBeautify()<cr>
autocmd FileType eruby noremap <buffer> <localleader>bb :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <localleader>bb :call CSSBeautify()<cr>
"}}}
"{{{vimscript
Plugin 'vim-support'
augroup filetype_vimscript
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END 
"}}}
"scrooloose/syntastic{{{
"syntax checking plugin
"Plugin 'scrooloose/syntastic'
let g:syntastic_disabled_filetypes=['javascript', 'js']
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_jslint_checkers=['jshint']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"}}}
"{{{ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
Plugin 'kien/ctrlp.vim'
nnoremap <C-A-b> :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'
"}}}
"{{{FuzzyFinder
"Plugin 'FuzzyFinder'
"nmap <localleader>f :FufFileWithCurrentBufferDir<CR>
"nmap <localleader>b :FufBuffer<CR>
"nmap <localleader>t :FufTaggedFile<CR>
"}}}
" run and compile {{{
" nnoremap <F9> :SCCompile<cr>
"nnorema:C_CplusLFlags          = '-Wall -g -O0'         " C++ compiler flags:
"link   , don't optimize
" nnoremap <F10> :SCCompileRun<cr>
nnoremap <localleader>run :execute "!%"<CR>
nnoremap <F12> :execute "!./" .  expand("%:r") . " < in"<cr>
" }}}



"vundle end{{{
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

"plugins{{{
"highlight errors {{{
nnoremap <leader>w :match Error /\v +$/<cr>
nnoremap <leader>W :match none<cr>k}}}
"editing set{{{
"set foldmethod=indent
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set cindent
set number
set hlsearch incsearch
"}}}
"statusline--- {{{
"set statusline=%F          fullpath
"set statusline=%.20F       change the maximum width
set statusline=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
set statusline+=%{fugitive#statusline()} " which branch
set statusline+=(%2v)%4l   " Current line
"set statusline=%04l
"set statusline=%-4l
set statusline+=/    " Separator
set statusline+=%L   " Total lines
"}}}
"abbreviations {{{
iabbrev "- "----------------------------
iabbrev mysig -- <cr>Jie Feng<cr>jokerfeng2010@gmai.com
iabbrev ednl endl
"}}}
"normal mode mappings {{{
"---------------------------- select a word
noremap <localleader><space> viw
"---------------------------- no further mapping
noremap <localleader>do ggVG:!tr '\n' ' '<cr><esc>"+yy
"nnoremap <c-u> viwUw
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"}}}
"insert mode mappings {{{
"inoremap <c-d> <esc>ddi
"inoremap <c-u> <esc>lviwUwi
"}}}
"visual mode mappings {{{
"vnoremap " <esc>`<i"<esc>`>a"<esc>
"}}}
"operator-pending mappings {{{
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap ie :<c-u>execute "normal! 
            \/[a-zA-Z0-9._]\\+@[a-zA-Z0-9._]\\+\\.[a-zA-Z]\\{2,3}\rv/@\rE"<cr>
"}}}
"open window-buffer mappings {{{
nnoremap <localleader>pb :execute "rightbelow vsplit  " . bufname("#")  <cr>
"}}}
"move around compile errors {{{
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprevious<cr>
"}}}
"FileType specific settings{{{

let foldlevel=2
"text {{{
augroup text
    autocmd!
    autocmd FileType text nnoremap <F7> :set ft=tex<cr>
    autocmd FileType text onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType text onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
"}}}

"}}}
"{{{settings
filetype plugin indent on
set tabpagemax=100
set mouse=a
colorscheme desert
let mapleader = ","
let maplocalleader = "\\"
let g:pep8_map='<leader>8'
map <localleader>g :GundoToggle<CR>
set tags=tags
set guioptions-=T
set autoread
nnoremap Q <nop>
"{{{default folder 
if has("unix") 
elseif has("win32") 
    if exists("$OS") && ($OS == "Windows_NT") 
        cd D:\cygwin64\home\joker_000\
    else 
        cd "~" 
    endif 
endif 
"}}}
"{{{tab completion and documentation
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"}}}
"}}}
"{{{handy shortcuts
"edit file{{{
nmap <localleader>ev :tabedit $MYVIMRC<cr>'tzo
nmap <localleader>em :tabedit makefile
nmap <localleader>ej :tabedit ~/.jshintrc<cr>'tzo
"}}}
"{{{shell
nnoremap <localleader>sh :sh<cr>
let g:BASH_AuthorName   = 'Jie Feng'
let g:BASH_Email        = 'jokerfeng2010@gmail.com'
let g:BASH_Company      = 'The Johns Hopkins'
"}}}
"{{{spell
function! SpellCheck()
    if (&spell)
        set nospell
    else
        set spell
    endif
endfunction
noremap <localleader>spc :call SpellCheck()<cr>
"}}}
"{{{search shortcuts
"nnoremap / /\v
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <localleader>h :set hlsearch!<cr>
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
"}}}
"{{{copy paste 
"copy all inside vim
nnoremap <C-A> <esc>ggyG
"copy all out of vim
nnoremap <C-X><C-A> <esc>gg"+yG
"copy text in visual mode
vnoremap <C-C> "+yy
"paste text in insertion mode
inoremap <C-X><C-V> <esc>"+pa
"paste text in normal mode
nnoremap <C-X><C-V> "+p
"}}}
"move tabs{{{
nnoremap <C-l> gt
nnoremap <C-h> gT
inoremap <C-l> <esc>gt
inoremap <C-h> <esc>gT
nnoremap <C-left> gT
nnoremap <C-right> gt
inoremap <C-left> <esc>gT
inoremap <C-right> <esc>gt
"}}}
"{{{candidates
"inoremap <esc> <nop>              "disable key 
"autocmd BufNewFile * :write
"autocmd BufWritePre,BufRead *.html :normal gg=G
"autocmd BufWritePost .vimrc :source ~/.vimrc
"}}}
"}}}
