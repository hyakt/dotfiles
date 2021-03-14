# PATH
#------------------
# sbin
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
# my shell
set -g fish_user_paths "$HOME/.bin/" $fish_user_paths
# anyenv
set -g fish_user_paths "$HOME/.anyenv/bin" $fish_user_paths

# Env
#----------
if which anyenv > /dev/null 2>&1;
    anyenv init - | source
end
if which direnv > /dev/null 2>&1;
    direnv hook fish | source
    set -x DIRENV_LOG_FORMAT ""
end

# go
set -g fish_user_paths "$GOENV_ROOT/bin" $fish_user_paths
set -g fish_user_paths "$GOPATH/bin" $fish_user_paths

# rust
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

# deno
set -g fish_user_paths "$HOME/.deno/bin" $fish_user_paths

# Android
set -g fish_user_paths "$HOME/Library/Android/sdk/platform-tools" $fish_user_paths

source (brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# fish general settings
#-----------
set fish_greeting
set GHQ_SELECTOR peco

# key bindings
#-----------
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
    bind \cx\cb peco_checkout_git_branch
    bind \cx\ck peco_kill
    bind \cx\cr peco_recentd
    bind \cx\cf '__fzf_find_file'
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
    balias ls 'exa'
    balias l exa
end

## gcloud
balias gcp 'gcloud compute copy-files'
balias glist 'gcloud compute instances list'
balias gsh 'gcloud compute ssh'
balias gup 'gcloud compute instances start'
balias gdown 'gcloud compute instances stop'

## docker
balias d 'docker'
balias dc 'docker-compose'

## npm
balias n 'npm'

## yarn
balias y 'yarn'

## rails
balias r rails
