#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error

finished=install_finised

rm ~/.vimrc
ln ~/.vim/.vimrc ~/.vimrc -s

cd bundle/

cd tern_for_vim/
sudo npm install
cd ..


sudo apt install cmake
cd YouCompleteMe/
if [ ! -e $finished ] 
then
    touch $finished
    ./install.sh --clang-completer
fi
cd ..

cd vim-node/
bundle install
cd ..
