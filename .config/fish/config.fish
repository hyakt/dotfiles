#-----------
# key bindings
#-----------
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

#-----------
# editor
#-----------
export EDITOR='vim'
export SVN_EDITOR='vim'

#-----------
# alias
#-----------
balias g git
balias e emacsclient
## gcloud
balias gcp 'gcloud compute copy-files'
balias glist 'gcloud compute instances list'
balias gsh 'gcloud compute ssh'
balias gup 'gcloud compute instances start'
balias gdown 'gcloud compute instances stop'