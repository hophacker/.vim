#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error
grep map .vimrc -n
