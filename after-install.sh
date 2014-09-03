#!/bin/bash - 
#===============================================================================
#
#          FILE: after-install.sh
# 
#         USAGE: ./after-install.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/02/2014 01:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
cd bundle/

cd tern_for_vim/
npm install
cd ..

cd YouCompleteMe/
./install.sh --clang-completer
cd ..
