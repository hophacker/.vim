#!/bin/bash - 
#===============================================================================
#
#          FILE: YouCompleteMe.sh
# 
#         USAGE: ./YouCompleteMe.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 01/06/2015 01:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
sudo pip install flake8 nose mock pyhamcrest
