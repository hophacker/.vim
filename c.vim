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
let g:SuperTabDefaultCompletionType = "<C-n>"
let g:SuperTabContextDefaultCompletionType = '<C-x><C-u>'
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
"cvim{{{
Plugin 'git://github.com/hophacker/cvim'
let s:C_CFlags         				= ' -g -O0 -c'      " C compiler flags: compile, don't optimize
let s:C_LFlags         				= ' -g -O0'         " C compiler flags: link   , don't optimize
let s:C_CplusCFlags         	= '-std=c++11 -g -O0 -c -Wno-deprecated'      " C++ compiler flags: compile, don't optimize
let s:C_CplusLFlags         	= '-std=c++11 -g -O0 -Wno-deprecated'         " C++ compiler flags: link   , don't optimize
"}}}
