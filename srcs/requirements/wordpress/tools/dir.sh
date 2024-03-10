#!/bin/bash
if [ ! -d "/Users/lbapart/data" ] ; then
    mkdir -p /Users/lbapart/data
    mkdir -p /Users/lbapart/data/wordpress
    mkdir -p /Users/lbapart/data/mariadb
fi

# if [! -d "/home/${USER}/data"] ; then
#     mkdir /home/${USER}/data
#     mkdir /home/${USER}/data/wordpress
#     mkdir /home/${USER}/data/mariadb
# fi
