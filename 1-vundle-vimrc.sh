#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error
ROOT=`pwd`
VUNDLE=bundle/vundle 
if [[ ! -e $VUNDLE ]] 
then
    git clone https://github.com/gmarik/Vundle.vim $VUNDLE
fi

VIMRC=$HOME/.vimrc
if [[ -e "$VIMRC" ]] 
then
  rm $VIMRC
fi
ln $ROOT/.vimrc -s $VIMRC
