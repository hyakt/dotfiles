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
export FZF_DEFAULT_OPTS='--layout=reverse --border none --exit-0'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#f0f0f0,bg:-1,hl:#5f87af
 --color=fg+:#ffffff,bg+:-1,hl+:#5fd7ff
 --color=info:#afaf87,prompt:#ff529d,pointer:#7eebfc
 --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'


# fish general settings
#-----------
set fish_greeting

# key bindings
#-----------
function fish_user_key_bindings
    bind \cr fzf_history
    bind \cx fzf_checkout_git_branch
    bind \ct 'tmux attach -t (tmux ls | fzf | cut -d : -f 1)'
    bind \ep fzf_checkout_gh_pr
    bind \ed fzf_cd_git
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
if which bat > /dev/null 2>&1;
    balias cat bat
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
