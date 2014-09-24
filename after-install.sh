#!/bin/bash - 

finished=install_finised
set -o nounset                              # Treat unset variables as an error
cd bundle/

cd tern_for_vim/
npm install
cd ..

cd YouCompleteMe/
if [ !-e $finished ] 
then
    touch $finished
    ./install.sh --clang-completer
fi
cd ..

cd vim-node/
bundle install
cd ..
