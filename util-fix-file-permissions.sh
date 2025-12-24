#!/usr/bin/env bash




##
## ## go to work dir
##

cd icons
#cd icons/StormTrooper




##
## ## chmod for dir
##

find . -type d -exec chmod 755 '{}' \;




##
## ## chmod for file
##

find . -type f -exec chmod 644 '{}' \;
