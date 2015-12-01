#------------
#PATH setting
#------------

PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PATH

#------------
#Prompt
#------------
set_prompt () {
    Last_Command=$? # Must come first!
    # Regular Colors
    Cyan='\e[0;36m'         # Cyan
    White='\e[0;37m'        # White

    # Bold
    BRed='\e[1;31m'         # Red
    BYellow='\e[1;33m'      # Yellow
    BPurple='\e[1;35m'      # Purple
    Reset='\[\e[00m\]'

    # Add a bright white exit status for the last command
    PS1=""

    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$BRed\\h "
    else
        PS1+="$BPurple\\h "
    fi

    PS1+="$Cyan\\w "

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$White"
    else
        PS1+="$BYellow"
    fi

    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="\$ $Reset"
}

PROMPT_COMMAND='set_prompt'

#-----------
#Editor
#-----------

export EDITOR='emacs -q -nw'
export EDITOR=ja_JP.UTF-8

#-----------
#alias
#-----------

#emacs
alias emacs='emacs -q -nw'
alias e='emacsclient'

#ls
alias ls='ls -hGF'
alias la='ls -aGhF'
alias ll='ls -lGhF'

#extract:解凍
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

 # 保管
 if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
 fi
