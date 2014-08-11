"edite by Jie Feng yes
"vundle{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'alfredodeza/pytest.vim'
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'Hackerpilot/DCD'
Plugin 'jcf/vim-latex'
Plugin 'klen/python-mode'
Plugin 'klen/rope-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'marcweber/vim-addon-manager'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'

"nvie/vim-flake8{{{
Plugin 'nvie/vim-flake8'
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,W293"
let g:flake8_max_line_length=99
let g:flake8_max_complexity=10
autocmd BufWritePost *.py call Flake8()
"let g:flake8_cmd="/opt/strangebin/flake8000"
"}}}
Plugin 'nvie/vim-pyunit'
Plugin 'Rip-Rip/clang_complete'
"scrooloose/nerdtree{{{
Plugin 'scrooloose/nerdtree'
map <localleader>n :NERDTreeToggle<CR>
"}}}
"scrooloose/syntastic{{{
Plugin 'scrooloose/syntastic'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"}}}
Plugin 'sirver/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-rails.git'
Plugin 'vim-perl/vim-perl'
Plugin 'vim-scripts/awk.vim'
Plugin 'vim-scripts/pydoc.vim'
"taglist{{{
Plugin 'vim-scripts/taglist.vim'
nnoremap <silent> <F4> :TlistUpdate<CR> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Open=0
"}}}
"{{{xuhdev/SingleCompile
Plugin 'xuhdev/SingleCompile'
nmap <F9> :SCCompile<cr> 
nmap <F10> :SCCompileRun<cr> 
"}}}
"taskList{{{
Plugin 'TaskList.vim'
map <localleader>td <Plug>TaskList
"}}}
Plugin 'vim-support'
"cvim{{{
Plugin 'git://github.com/hophacker/cvim'
let s:C_CFlags         				= ' -g -O0 -c'      " C compiler flags: compile, don't optimize
let s:C_LFlags         				= ' -g -O0'         " C compiler flags: link   , don't optimize
let s:C_CplusCFlags         	= '-std=c++11 -g -O0 -c -Wno-deprecated'      " C++ compiler flags: compile, don't optimize
let s:C_CplusLFlags         	= '-std=c++11 -g -O0 -Wno-deprecated'         " C++ compiler flags: link   , don't optimize
"}}}
"perl{{{
Plugin 'mileszs/ack.vim'
"}}}
Plugin 'vim-scripts/VimLite'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-scripts/bash-support.vim'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
"}}}
set tabpagemax=100
set mouse=a
colorscheme desert
let mapleader = ","
let maplocalleader = "\\"
let g:pep8_map='<leader>8'
map <localleader>g :GundoToggle<CR>
set tags=tags
set guioptions-=T
" run and compile {{{
" nnoremap <F9> :SCCompile<cr>
"nnorema:C_CplusLFlags          = '-Wall -g -O0'         " C++ compiler flags:
"link   , don't optimize
" nnoremap <F10> :SCCompileRun<cr>
nnoremap <localleader>run :execute "!%"<CR>
nnoremap <F12> :execute "!./" .  expand("%:r") . " < in"<cr>
" }}}
nnoremap Q <nop>

"functions{{{
function! Repeat()
    let times = input("Count: ")
    let char  = input("Char: ")
    exe ":normal a" . repeat(char, times)
endfunction
"}}}
"localleader{{{
nnoremap <localleader>ia mzgg=G`z
nnoremap <localleader>rf :e<cr>
"edit .vimrc and refresh{{{
nmap <localleader>ev :tabedit $MYVIMRC<cr>'tzo
nmap <localleader>em :tabedit makefile
nnoremap <localleader>sv :source $MYVIMRC<cr>
nnoremap <localleader>ft :execute 'set ft=' . &filetype<cr>
nnoremap <localleader>s% :source %<cr>
"}}}
"}}}
inoremap <C-u> <C-o>:call Repeat()<cr>
"---------------------------- omnicompletion BEGIN
let b:pymode_modified=1
syntax on
filetype on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"---------------------------- omnicompletion END
"shortcuts for searching patterns
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
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
" bash{{{
let g:BASH_AuthorName   = 'Jie Feng'
let g:BASH_Email        = 'jokerfeng2010@gmail.com'
let g:BASH_Company      = 'The Johns Hopkins'
"}}}
" clang_complete{{{
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
"text {{{
augroup text
    autocmd!
    autocmd FileType text nnoremap <F7> :set ft=tex<cr>
    autocmd FileType text onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType text onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
"}}}
"vim {{{
augroup filetype_vim
    autocmd!
    "autocmd FileType cpp,vim setlocal foldmethod=indent
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
"c/cpp {{{
augroup filetype_c_cpp
    autocmd!
    autocmd FileType *
                \	if ( &filetype == 'cpp' || &filetype == 'c') |
                \	    set nowrap |
                \	endif
augroup END
"}}}
"javascript {{{
augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END
"}}}
"sh {{{
augroup filetype_sh
    autocmd!
augroup END
"}}}
"python {{{
augroup filetype_python
    autocmd!
    "autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python nnoremap <F12> :execute "!./" .  expand("%") <CR>
    autocmd FileType python setlocal foldlevel=99
    autocmd FileType python setlocal statusline=%f-%y-[%l]/[%L]
    autocmd FileType python nnoremap <buffer> <localleader>c I#cesc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
"}}}
"ruby {{{
augroup filetype_ruby
    autocmd!
    autocmd FileType ruby set sw=2
    autocmd FileType ruby nnoremap <F9> :execute "!ruby ./" .  expand("%") <CR>
    autocmd FileType ruby setlocal statusline=%f-%y-[%l]/[%L]
augroup END
"}}}
"html {{{
augroup filetype_html
    autocmd!
    autocmd BufWritePre,BufRead *.html setlocal nowrap
    autocmd FileType html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
    autocmd FileType html iabbrev <buffer> --- &mdash;
    autocmd FileType html iabbrev <buffer> `` &ldquo;
    autocmd FileType html iabbrev <buffer> '' &rdquo;
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
"}}}
"tex {{{
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
"perl {{{
augroup filetype_perl
    autocmd!
    autocmd FileType perl noremap <F10> :!perl % <cr>
augroup END
"}}}
"pathogen load"{{{
set laststatus=2
set nocp
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
"}}}
"markdown{{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown set spell
    autocmd FileType markdown nnoremap <F8> :!./commit.sh<cr>
augroup END
"}}}
"vimscript {{{
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

"}}}
"}}}
"shorcut candidates{{{
"---------------------------- disable key :inoremap <esc> <nop>
"autocmd BufNewFile * :write
"autocmd BufWritePre,BufRead *.html :normal gg=G
"autocmd BufWritePost .vimrc :source ~/.vimrc
"}}}
"set default folder {{{
if has("unix") 
elseif has("win32") 
    if exists("$OS") && ($OS == "Windows_NT") 
        cd D:\cygwin64\home\joker_000\
    else 
        cd "~" 
    endif 
endif 
"}}}
"---------handy shortcuts--------------------{{{
function! MouseAction(state)
    execute "!xinput set-prop 14 'Device Enabled' " . a:state 
endfunction

function! SpellCheck()
    if (&spell)
        set nospell
    else
        set spell
    endif
endfunction

noremap <localleader>spc :call SpellCheck()<cr>
nnoremap / /\v
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <localleader>h :set hlsearch!<cr>
nnoremap <localleader>sh :sh<cr>



nnoremap <C-A> <esc>ggyG
nnoremap <C-X><C-A> <esc>gg"+yG
vnoremap <C-C> "+yy
inoremap <C-X><C-V> <esc>"+pa
nnoremap <C-X><C-V> "+p
"open touch pad

nnoremap <silent> <C-X><C-M> :call MouseAction(1)<cr><cr>
nnoremap <silent> <C-X><C-N> :call MouseAction(0)<cr><cr>
"}}}
"-move tabs{{{
nnoremap <C-l> gt
nnoremap <C-h> gT
inoremap <C-l> <esc>gt
inoremap <C-h> <esc>gT
nnoremap <C-left> gT
nnoremap <C-right> gt
inoremap <C-left> <esc>gT
inoremap <C-right> <esc>gt
"}}}
"tab completion and documentation{{{
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"}}}
