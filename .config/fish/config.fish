# general settings
#------------------
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths /usr/local/lib/ruby/gems/2.6.0/bin $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# key bindings
#-----------
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
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
balias l exa

## gcloud
balias gcp 'gcloud compute copy-files'
balias glist 'gcloud compute instances list'
balias gsh 'gcloud compute ssh'
balias gup 'gcloud compute instances start'
balias gdown 'gcloud compute instances stop'

## docker
balias d 'docker'
balias dc 'docker container'
