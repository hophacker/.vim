"Jie Feng's .vimrc, jiefeng.hopkins@gmail.com
call plug#begin('~/.vim/plugged')
source ~/.vim/functions.vim
"settings{{{
filetype plugin indent on
filetype plugin indent on
set relativenumber
set autoread
set number
set autochdir
set ts=2
set sw=2
set history=700
set tabpagemax=100
set autoread
set so=5 "set 5 lines to the cursor
set cmdheight=1
set encoding=utf8
set tags=tags
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.cache     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
syntax enable 
nnoremap Q <nop>
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
"Habit breaking {{{
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
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
"{{{leader
let mapleader = "\\"
let g:mapleader = "\\"
nm <leader>cf m'gg=G`'
nm <leader>lm :marks<cr>
nm <leader>P :InstantMarkdownPreview<cr>
nm <silent><Leader><C-]> <C-w><C-]><C-w>T
nmap <leader>w :w!<cr>
nmap <leader>tf <c-w>gf
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
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>h :set hlsearch!<cr>
"Toggle paste mode on and off
map <leader>md :tabe ~/buffer.md<cr>
"}}}
"{{{localleader
let maplocalleader = ","
let g:maplocalleader = ","
"}}}
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
Plug 'easymotion/vim-easymotion' "{{{
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"}}}
"{{{statusline
Plug 'bling/vim-airline' 
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"}}}
Plug 'ervandew/supertab'
Plug 'tomtom/tlib_vim' " This library provides some utility functions
Plug 'evanmiller/nginx-vim-syntax'
Plug 'marcweber/vim-addon-manager'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'derekwyatt/vim-scala'
"{{{ultisnips
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nmap <localleader>ue :UltiSnipsEdit<cr>
"}}}
"{{{gundo
Plug 'sjl/gundo.vim'
map <leader>gg :GundoToggle<CR>
"}}}
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
"pathogen"{{{
Plug 'tpope/vim-pathogen'
set laststatus=2
set nocp
execute pathogen#infect()
execute pathogen#helptags()
"}}}
"
"{{{code completion, complete
Plug 'ternjs/tern_for_vim'
let g:tern_show_argument_hints = 'on_hold'
let g:tern_map_keys = 1
noremap <leader>tr :TernRename<CR>
noremap <leader>tf :TernRefs<CR>
noremap <leader>tdd :TernDef<CR>
noremap <leader>tdp :TernDefPreview<CR>
noremap <leader>tds :TernDefSplit<CR>
noremap <leader>tdt :TernDefTab<CR>

Plug 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"let g:ycm_server_use_vim_stdout = 1 
"let g:ycm_server_log_level = 'debug'
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"set completeopt-=preview
"}}}
"{{{snipmate snippets
"Plugin 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
imap <C-L> <Plug>snipMateShow
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'
"}}}
"scrooloose/nerdtree{{{
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
map <F5> :NERDTreeToggle<CR>
map <F6> :NERDTreeTabsToggle<CR>
"autocmd vimenter * NERDTree
"}}}
"{{{ruby rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
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
"{{{perl awk bash
Plug 'vim-perl/vim-perl'
Plug 'vim-scripts/awk.vim'
Plug 'vim-scripts/bash-support.vim'
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
Plug 'majutsushi/tagbar'
nmap <F4> :TagbarToggle<CR>
"}}}
"taskList{{{
Plug 'TaskList.vim'
map <localleader>td <Plug>TaskList
"}}}
"{{{git github markdown
Plug 'plasticboy/vim-markdown'
"Plugin 'greyblake/vim-preview'
Plug 'suan/vim-instant-markdown' "{{{
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 1
"}}}
augroup filetype_markdown
  autocmd!
  autocmd FileType mkd setlocal spell
  autocmd FileType mkd setlocal sw=2 ts=2
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:vim_markdown_initial_foldlevel=1
augroup END
"}}}
Plug 'mxw/vim-jsx'
Plug 'gcmt/taboo.vim'
Plug 'dkprice/vim-easygrep'
Plug 'lervag/vimtex'
Plug 'tpope/vim-abolish'
nmap <leader>tt :TabooRename 
inoremap <leader>cb 「」


let g:jsx_ext_required = 0
"let g:jsx_pragma_required = 1
"{{{code beautify
Plug 'einars/js-beautify'
autocmd FileType javascript noremap <buffer>  <localleader>bb :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <localleader>bb :call HtmlBeautify()<cr>
autocmd FileType eruby noremap <buffer> <localleader>bb :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <localleader>bb :call CSSBeautify()<cr>
"}}}
"{{{vimscript
Plug 'tpope/vim-git'
Plug 'vim-support'
augroup filetype_vimscript
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim let g:foldlevel=1
augroup END 
"}}}
"{{{ctrlp
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap  <leader>b :CtrlPBuffer<cr>
nnoremap  <leader>m :CtrlPMRUFiles<cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|cache)$'
      \ }
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
"{{{latex
augroup filetype_tex
  autocmd!
  autocmd FileType tex nnoremap <F9> :execute "!pdflatex " .  expand("%") . " && evince " .  expand("%:r") . ".pdf &" <CR>
  autocmd FileType tex nnoremap <F10> :execute "!latexmk -pvc " .  expand("%") . " -pdf &" <CR>
augroup END
"}}}
"{{{handy shortcuts
"edit file{{{
nmap <leader>ev :tabedit $MYVIMRC<cr>'tzo
nmap <leader>em :tabedit makefile
nmap <leader>ej :tabedit ~/.jshintrc<cr>'tzo
"}}}
"{{{search shortcuts
"nnoremap / /\v
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
vnoremap <C-X><C-X> "+d
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
" The ack {{{
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"}}}
Plug 'xolox/vim-misc'
"tab management {{{
Plug 'xolox/vim-session'
let g:session_autosave = 'no'
let g:session_autoload = 'no'
nmap <localleader>os :OpenSession default<cr>
nmap <localleader>ws :SaveSession default<cr>
"}}}
Plug 'gorodinskiy/vim-coloresque'
Plug 'editorconfig/editorconfig-vim'

Plug 'maxbrunsfeld/vim-yankstack'
nmap Y y$
let g:yankstack_yank_keys = ['y', 'd']
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
call plug#end()
