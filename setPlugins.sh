#!/bin/bash - 
#===============================================================================
#
#          FILE: setPlugins.sh
# 
#         USAGE: ./setPlugins.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/14/2014 17:26
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
if [[ ! -e bundle/vundle ]] 
then
    git clone https://github.com/gmarik/Vundle.vim bundle/vundle
fi

#jslint(http://github.com/hallettj/jslint.vim)
sudo apt-get install rhino
sudo npm install -g jshint
