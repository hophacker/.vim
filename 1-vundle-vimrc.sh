#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error
ROOT=`pwd`
#VUNDLE=bundle/vundle 
#if [[ ! -e $VUNDLE ]] 
#then
    #git clone https://github.com/gmarik/Vundle.vim $VUNDLE
#fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

VIMRC=$HOME/.vimrc
if [[ -e "$VIMRC" ]] 
then
  rm $VIMRC
fi
ln -s $ROOT/.vimrc $VIMRC
