#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error
if [[ ! -e bundle/vundle ]] 
then
    git clone https://github.com/gmarik/Vundle.vim bundle/vundle
fi

#jslint(http://github.com/hallettj/jslint.vim)
sudo apt install rhino npm
sudo npm install -g jshint
sudo pip install vim_bridge
