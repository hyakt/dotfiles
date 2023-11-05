#!/usr/bin/env bash

# for macOS
# -------------------
DOTFILES_REPO_PATH="$HOME/repos/github.com/hyakt/dotfiles"
TPM_PATH="$HOME/.config/tmux/plugins/tpm"

echo "🐷< Start setup! Maybe You'll fail, Sorry!"
echo "--------------------"

chsh -s /bin/bash

if test ! $(which xcode-select); then
    echo "- install xcode"
    if ! xcode-select --install; then
      exit 1;
    fi
fi

echo "- dotfile symlink"
if [ ! -d $DOTFILES_REPO_PATH ]; then
    mkdir -p $DOTFILES_REPO_PATH
    git clone https://github.com/hyakt/dotfiles $DOTFILES_REPO_PATH
fi
cd $DOTFILES_REPO_PATH
rm -rf ~/.config
chmod +x ./symlink.sh
bash -c ./symlink.sh;

echo "- install homebrew"
if test ! $(which brew); then
    if ! bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
      exit 1;
    fi
fi
brew bundle --no-lock install

echo "- setup tmux"
if [ ! -d $TPM_PATH ]; then
    mkdir -p $TPM_PATH
    git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi
if ! bash -c $TPM_PATH/scripts/install_plugins.sh; then
  exit 1;
fi

echo "- setup fish"
fish -c 'cd $__fish_config_dir; curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher &&  git checkout fish_plugins && fisher update'

exit 0
