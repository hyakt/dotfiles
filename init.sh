#!/usr/bin/env bash

REPO_PATH="$HOME/repos/github.com/hyakt/"
TPM_PATH="$HOME/.config/tmux/plugins/tpm"


# for macOS
# -------------------

echo ""
echo "🐷< Install XCode Command Line"
echo "--------------------"

which -s xcode-select
if [[ $? != 0 ]] ; then
    xcode-select --install
    else
      echo "Already XCode Command Line installed";
fi

echo ""
echo "🐷< Change shell to bash"
echo "--------------------"
chsh -s /bin/bash

echo ""
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
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    else
      echo "Already homebrew installed";
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
