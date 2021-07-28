#!/usr/bin/env bash

# for macOS
# -------------------
# install homebrew
# https://brew.sh/index_ja
which -s brew
if [[ $? != 0 ]] ; then
    echo "🐷 < Install homebrew!"
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

# brew bundle install
echo ""
echo "🐷 < Bundle install homebrew!"
brew bundle --no-lock install

echo ""
echo "🐷 < Create dotfiles symlink!"
mkdir -p ~/repos/github.com/hyakt/
cd ~/repos/github.com/hyakt/
git clone https://github.com/hyakt/dotfiles
cd dotfiles
chmod +x ./symlink.sh
rm -rf ~/.config
sh ./symlink.sh

## tmux
echo "🐷 < tpm!"
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## fish
echo '🐷 < chsh fish!'
if [[ $SHELL != "/usr/local/bin/fish" ]] ; then
    sudo sh -c "echo /usr/local/bin/fish >> /etc/shells"
    chsh -s /usr/local/bin/fish
    fish
fi
# cd $__fish_config_dir
# fish -c curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# git reset --hard head
# fisher update

exit 0
