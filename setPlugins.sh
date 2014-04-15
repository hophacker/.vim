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
git clone https://github.com/gmarik/Vundle.vim bundle/vundle
