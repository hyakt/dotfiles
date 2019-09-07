# general settings
#------------------
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "$HOME/git/github.com/flutter/flutter/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.pub-cache/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.anyenv/bin" $fish_user_paths

if which anyenv > /dev/null 2>&1;
    anyenv init - | source
end

set GHQ_SELECTOR peco

# key bindings
#-----------
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
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
balias gh 'hub browse (ghq list | peco | cut -d "/" -f 2,3)'

## gcloud
balias gcp 'gcloud compute copy-files'
balias glist 'gcloud compute instances list'
balias gsh 'gcloud compute ssh'
balias gup 'gcloud compute instances start'
balias gdown 'gcloud compute instances stop'

## docker
balias d 'docker'
balias dc 'docker container'

## yarn
balias y 'yarn'
