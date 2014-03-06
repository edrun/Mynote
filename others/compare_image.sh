#!/bin/bash


while [ -d $a ]; do
    echo "please input source dir a:"
    read a
    echo "please input dest dir b:"
    read b
    continue
done

if [ -d $a   ]; then
    rsync -a --exclude=".svn/" --delete $a $b
fi
