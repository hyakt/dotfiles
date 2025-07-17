#!/bin/sh
cd $(dirname $0)

for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.DS_Store' ]
    then
        ln -Fis "$PWD/$dotfile" "$HOME/$dotfile"
    fi
done

rm -f $HOME/.gitconfig
echo "[include]
	path = $(pwd)/.gitconfig" > $HOME/.gitconfig
