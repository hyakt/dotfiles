#!/bin/sh
cd $(dirname $0)

for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# oh-my-fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish
