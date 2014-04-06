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
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tlib_vim.git'
Plugin 'tomtom/tlib_vim'
Plugin 'sirver/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'marcweber/vim-addon-manager'
Plugin 'klen/python-mode'
Plugin 'garbas/vim-snipmate'
"Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-git'
Plugin 'Rip-Rip/clang_complete'
Plugin 'xuhdev/SingleCompile'
"Plugin 'vim-scripts/VimLite'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
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
colorscheme desert
let mapleader = ","
let maplocalleader = "\\"
let g:pep8_map='<leader>8'
map <localleader>g :GundoToggle<CR>
set tags=tags
set guioptions-=T
nnoremap Q <nop>
let g:syntastic_cpp_compiler_options = ' -std=c++11'
function! Repeat()
    let times = input("Count: ")
    let char  = input("Char: ")
    exe ":normal a" . repeat(char, times)
endfunction
inoremap <C-u> <C-o>:call Repeat()<cr>
nnoremap <localleader>ia mzgg=G`z
nnoremap <localleader>rf :e<cr>
"---------------------------- omnicompletion BEGIN
syntax on
filetype on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"---------------------------- omnicompletion END
"shortcuts for searching patterns
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
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
"edit .vimrc and plugins{{{
nmap <localleader>ev :tabedit $MYVIMRC<cr>'tzo
nmap <localleader>em :tabedit makefile
nnoremap <localleader>sv :source $MYVIMRC<cr>
"execute 'set ft=' . &filetype<cr>
nnoremap <localleader>s% :source %<cr>
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
let g:clang_auto_select=1
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
"python {{{
augroup filetype_python
    autocmd!
    "autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99
    autocmd FileType python setlocal statusline=%f-%y-[%l]/[%L]
    autocmd FileType python nnoremap <buffer> <localleader>c I#cesc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
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
" run and compile {{{
nnoremap <F9> :SCCompile<cr>
nnoremap <F10> :SCCompileRun<cr>
"nnoremap <F12> :echo "!./" .  expand("%:r") . " < in"<cr>
nnoremap <F12> :execute "!./" .  expand("%:r") . " < in"<cr>
" }}}
"for taglist {{{

nnoremap <silent> <F4> :TlistUpdate<CR> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Open=0
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

noremap <localleader>sc :call SpellCheck()<cr>
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
"{{{
map <localleader>n :NERDTreeToggle<CR>
"}}}
"TaskList{{{
map <localleader>td <Plug>TaskList
"}}}
"syntastic{{{
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"}}}
"tab completion and documentation{{{
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"}}}
