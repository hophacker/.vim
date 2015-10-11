#!/bin/bash - 
set -o nounset                              # Treat unset variables as an error
if [[ ! -e bundle/vundle ]] 
then
    git clone https://github.com/gmarik/Vundle.vim bundle/vundle
fi

#jslint(http://github.com/hallettj/jslint.vim)


if [ "$(uname)" == "Darwin" ]; then
  installCMD="brew"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  installCMD="sudo apt"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  echo hey
fi
$installCMD install rhino
sudo npm install -g jshint
sudo pip install vim_bridge
