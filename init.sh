#!/usr/bin/env bash

REPO_PATH="$HOME/repos/github.com/hyakt/"
TPM_PATH="$HOME/.config/tmux/plugins/tpm"

# for macOS
# -------------------
echo "🐷< Create dotfile symlinks"
echo "--------------------"
if [ ! -d $REPO_PATH/dotfiles ]; then
    mkdir -p $REPO_PATH
    git clone https://github.com/hyakt/dotfiles $REPO_PATH
fi
cd $REPO_PATH/dotfiles
rm -rf ~/.config
chmod +x ./symlink.sh
sh ./symlink.sh

echo ""
echo "🐷< Install homebrew"
echo "--------------------"
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle --no-lock install

echo ""
echo "🐷< Setup tmux"
echo "--------------------"
if [ ! -d $TPM_PATH ]; then
    mkdir -p $TPM_PATH
    git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi
sh $TPM_PATH/scripts/install_plugins.sh

echo ""
echo "🐷< Setup fish"
echo "--------------------"
fish -c "cd $__fish_config_dir;
     curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher;
     git checkout fish_plugins;
     fisher update;"

exit 0
