# Jie's Vim setup

## Install

### YouCompleteMe
*  [Install](http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/)
* After installed run `./install.sh --clang-completer --system-clang --system-boost
` to get semantic support for C-family languages
## Vim Usage

###Buffer

`:bn, :bp, :b #, :b name`, and `ctrl-6`(or `#ctrl-6` switches to buffer number #s).)to switch between buffers. 

* `\<C-w>gf` open file under cursor in a new tab 
* `<C-N>` open NERDTrees


##Vimscript

### concatenate string
```vimscript
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
```
