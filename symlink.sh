#!/bin/sh
cd $(dirname $0)

echo 'create symlink files'
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

echo 'create include files' #local設定をdotfilesに反映しないため
rm -f $HOME/.gitconfig
echo "[include]
	path = $(pwd)/.gitconfig" > $HOME/.gitconfig
