nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>


function! s:FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        copen
        " record the current window where you open up the quickfix
        " refered later when you open the quickfix-window
        let g:quickfix_return_to_window = winnr()
        let g:quickfix_is_open = 1
    endif
endfunction
