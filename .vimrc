"Jie Feng's .vimrc, jiefeng.hopkins@gmail.com
source ~/.vim/functions.vim
"settings{{{

filetype plugin indent on
filetype plugin indent on
set number
set ts=2
set sw=2
set history=700
set tabpagemax=100
set autoread
set so=5 "set 5 lines to the cursor
set cmdheight=1
set encoding=utf8
set tags=tags
syntax enable 
"}}}
"{{{line break
set lbr 
set tw=500 
"}}}"
"{{{tab indent
set expandtab
set smarttab
set autoindent
set smartindent
"}}}
"{{{search and case
set hlsearch incsearch
set ignorecase
set smartcase
"}}}
"backups{{{
"Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup 
set nowb
set noswapfile
"}}}
" Specify the behavior when switching between buffers {{{
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
"}}}
" Return to last edit position when opening files{{{
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
"}}}
"{{{mouse
if has('mouse')
  set mouse=a
endif
"}}}
"statusline{{{
"set statusline=%F          fullpath
"set statusline=%.20F       change the maximum width
  "set statusline=%f         " Path to the file
  "set statusline+=\ -\      " Separator
  "set statusline+=FileType: " Label
  "set statusline+=%y        " Filetype of the file
  "set statusline+=%{fugitive#statusline()} " which branch
  "set statusline+=(%2v)%4l   " Current line
  ""set statusline=%04l
  ""set statusline=%-4l
  "set statusline+=/    " Separator
  "set statusline+=%L   " Total lines
"}}}

"{{{leader
let mapleader = "\\"
let g:mapleader = "\\"
nm <leader>cf m'gg=G`'
nm <leader>lm :marks<cr>
nm <silent><Leader><C-]> <C-w><C-]><C-w>T
nmap <leader>w :w!<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"spell checking{{{
noremap <leader>ss :call SpellCheck()<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
"}}}
"edit .vimrc and refresh{{{
nnoremap <leader>ia mzgg=G`z
nnoremap <leader>rf :e<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ft :execute 'set ft=' . &filetype<cr>
nnoremap <leader>s% :source %<cr>
"}}}
"tabs management{{{
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
    "Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
    "Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"}}}
"Toggle paste mode on and off
map <leader>md :tabe ~/buffer.md<cr>
"}}}
"{{{localleader
let maplocalleader = ","
let g:maplocalleader = ","
"}}}

"{{{editing
"}}}
nnoremap Q <nop>
"{{{tab completion and documentation
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"}}}
"window, tabs{{{
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <c-l> gt
nnoremap <c-h> gT
inoremap <c-l> <esc>gt
inoremap <c-h> <esc>gT
"}}}

"vundle begin{{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
"}}}
"{{{statusline
Plugin 'bling/vim-airline' 
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"}}}
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim' " This library provides some utility functions
Plugin 'klen/rope-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'derekwyatt/vim-scala'
Plugin 'marcweber/vim-addon-manager'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
"{{{color scheme
try
    colorscheme desert
catch
endtry
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
"Plugin 'altercation/vim-colors-solarized' " color scheme
"if has('gui_running')
    "set background=light
"else
    "set background=dark
"endif
"colorscheme solarized
"}}}

"{{{ultisnips
Plugin 'sirver/ultisnips'

let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-x C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-x C-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}
"{{{gundo
Plugin 'sjl/gundo.vim'
map <localleader>g :GundoToggle<CR>
"}}}
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/VimLite'
Plugin 'L9' "provides some utility functions and commands for programming in Vim
"pathogen"{{{
Plugin 'tpope/vim-pathogen'
set laststatus=2
set nocp
execute pathogen#infect()
execute pathogen#helptags()
"}}}
"{{{code completion, complete
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_server_use_vim_stdout = 1 
let g:ycm_server_log_level = 'debug'
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
map <localleader>nt :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"}}}
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
"{{{ruby rails
Plugin 'tpope/vim-rails.git'
Plugin 'vim-ruby/vim-ruby'
augroup filetype_ruby
    autocmd!
    autocmd FileType ruby set sw=2
    autocmd FileType ruby set ts=2
    autocmd FileType ruby nnoremap <F9> :execute "!ruby ./" .  expand("%") <CR>
    autocmd FileType ruby setlocal statusline=%f-%y-[%l]/[%L]
augroup END
augroup filetype_eruby
    autocmd!
    autocmd FileType eruby set foldmethod=indent
augroup END
"}}}
source ~/.vim/python.vim
source ~/.vim/js.vim
source ~/.vim/html.vim
source ~/.vim/c.vim
"D language {{{
"let g:dcd_path=['/home/john/DCD/']
let g:dcd_importPath=['/home/john/programming/D/','/usr/include/dmd/druntime/import']
"}}}
"{{{perl awk bash
Plugin 'vim-perl/vim-perl'
Plugin 'vim-scripts/awk.vim'
Plugin 'vim-scripts/bash-support.vim'
augroup filetype_perl
    autocmd!
    autocmd FileType perl noremap <F10> :!perl % <cr>
augroup END
nnoremap <localleader>sh :sh<cr>
let g:BASH_AuthorName   = 'Jie Feng'
let g:BASH_Email        = 'jokerfeng2010@gmail.com'
let g:BASH_Company      = 'The Johns Hopkins'
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
Plugin 'plasticboy/vim-markdown'
Plugin 'greyblake/vim-preview'
augroup filetype_markdown
    autocmd!
    autocmd FileType mkd setlocal spell
    autocmd FileType mkd setlocal sw=4 ts=4
    let g:vim_markdown_initial_foldlevel=1
augroup END
"}}}
"{{{code beautify
Plugin 'einars/js-beautify'
autocmd FileType javascript noremap <buffer>  <localleader>bb :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <localleader>bb :call HtmlBeautify()<cr>
autocmd FileType eruby noremap <buffer> <localleader>bb :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <localleader>bb :call CSSBeautify()<cr>
"}}}
"{{{vimscript
Plugin 'tpope/vim-git'
Plugin 'vim-support'
augroup filetype_vimscript
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim let g:foldlevel=1
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
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
Plugin 'kien/ctrlp.vim'
nnoremap  <leader>b :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 'c'
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
"nnoremap <leader>w :match Error /\v +$/<cr>
"nnoremap <leader>W :match none<cr>k}}}
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
"nnoremap <C-u> viwUw
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"}}}
"insert mode mappings {{{
"inoremap <C-d> <esc>ddi
"inoremap <C-u> <esc>lviwUwi
"}}}
"visual mode mappings {{{
"vnoremap " <esc>`<i"<esc>`>a"<esc>
"}}}
"operator-pending mappings {{{
onoremap b /return<cr>
onoremap in( :<C-u>normal! f(vi(<cr>
onoremap il( :<C-u>normal! F)vi(<cr>
onoremap ie :<C-u>execute "normal! 
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

"text {{{
augroup text
    autocmd!
    autocmd FileType text nnoremap <F7> :set ft=tex<cr>
    autocmd FileType text onoremap <buffer> ih :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType text onoremap <buffer> ah :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
"}}}

"}}}
"{{{handy shortcuts
"edit file{{{
nmap <leader>ev :tabedit $MYVIMRC<cr>'tzo
nmap <leader>em :tabedit makefile
nmap <leader>ej :tabedit ~/.jshintrc<cr>'tzo
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
"{{{candidates
"inoremap <esc> <nop>              "disable key 
"autocmd BufNewFile * :write
"autocmd BufWritePre,BufRead *.html :normal gg=G
"autocmd BufWritePost .vimrc :source ~/.vimrc
"}}}
"}}}
