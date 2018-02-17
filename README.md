dotfiles
========
dotfilesの整理

下記をターミナルで実行
-------
* chmod +x ./symlink.sh
* bash ./symlink.sh

### fish
* brew install fish
* sudo sh -c "echo /usr/local/bin/fish >> /etc/shells"
* chsh -s /usr/local/bin/fish
* fish
* curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
  *(https://github.com/fisherman/fisherman/wiki/%E6%97%A5%E6%9C%AC%E8%AA%9E)*
* fisher
