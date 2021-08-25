# PATH
#------------------
# sbin
fish_add_path /usr/local/sbin
# my shell
fish_add_path $HOME/.bin/
# go
fish_add_path $GOENV_ROOT/bin
fish_add_path $GOPATH/bin
# rust
fish_add_path $HOME/.cargo/bin
# deno
fish_add_path $HOME/.deno/bin
# Android
fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path $HOME/Library/Android/sdk/emulator
fish_add_path /usr/local/opt/openjdk/bin
# gcloud
if test -e (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    source (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

# Env
#----------
source (brew --prefix asdf)/asdf.fish
if which direnv > /dev/null 2>&1;
    direnv hook fish | source
    set -x DIRENV_LOG_FORMAT ""
end
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end


# fish general settings
#-----------
set fish_greeting
set GHQ_SELECTOR peco

# key bindings
#-----------
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    bind \cx peco_checkout_git_branch
    bind \cq 'cd (git rev-parse --show-toplevel); commandline -f repaint;'
    bind \ct 'tmux attach -t (tmux ls | peco | cut -d : -f 1)'
end

# editor
#-----------
export EDITOR='vim'
export SVN_EDITOR='vim'

# alias
#-----------
## misc
balias g git
balias e emacsclient
if which exa > /dev/null 2>&1;
    balias ls exa
    balias l exa
end

## docker
balias d 'docker'
balias dc 'docker-compose'

## node
balias n 'npm'
balias y 'yarn'

## ruby
balias r rails
balias be 'bundle exec'

## gcloud
balias gcp 'gcloud compute copy-files'
balias glist 'gcloud compute instances list'
balias gsh 'gcloud compute ssh'
balias gup 'gcloud compute instances start'
balias gdown 'gcloud compute instances stop'
