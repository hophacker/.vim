#!/bin/bash - 
#===============================================================================
#
#          FILE: vim-instant-markdown.sh
# 
#         USAGE: ./vim-instant-markdown.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 12/10/2014 17:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
gem install pygments.rb
gem install redcarpet -v 2.3.0
npm -g install instant-markdown-d


