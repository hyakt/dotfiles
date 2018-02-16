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