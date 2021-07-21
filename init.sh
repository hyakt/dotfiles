#!/usr/bin/env bash

# for macOS
# -------------------
# install homebrew
# https://brew.sh/index_ja
which -s brew
if [[ $? != 0 ]] ; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

## create symlink
mkdir -p ~/repos/github.com/hyakt/
cd ~/repos/github.com/hyakt/
git clone https://github.com/hyakt/dotfiles
cd dotfiles
chmod +x ./symlink.sh
rm -rf ~/.config
./symlink.sh

## fish
brew install fish
sudo sh -c "echo /usr/local/bin/fish >> /etc/shells"
chsh -s /usr/local/bin/fish
fish
cd $__fish_config_dir
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
git reset --hard head
fisher update

## tmux
brew install tmux
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## installs
brew install asdf
brew install coreutils
brew install curl
brew install aspell
brew install bash-completion
brew install exa
brew install fd
brew install fzf
brew install gh
brew install ghq
brew install git
brew install htop
brew install jq
brew install peco
brew install ripgrep

exit 0
