#!/usr/bin/env bash




##
## ## go to work dir
##

cd icons




##
## ## archive / default edition
##

#tar cJf StormTrooper.tar.xz StormTrooper
tar -I 'xz -9 -T0' -cf StormTrooper.tar.xz StormTrooper




##
## ## archive / circle edition
##

#tar cJf StormTrooper-Circle.tar.xz StormTrooper-Circle
#tar -I 'xz -9 -T0' -cf StormTrooper-Circle.tar.xz StormTrooper-Circle
