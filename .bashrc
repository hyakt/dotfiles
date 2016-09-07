#------------
#Prompt
#------------
set_prompt () {
    Last_Command=$? # Must come first!
    # Regular Colors
    Cyan='\[\e[0;36m\]'         # Cyan
    White='\[\e[0;37m\]'        # White

    # Bold
    BRed='\[\e[1;31m\]'         # Red
    BYellow='\[\e[1;33m\]'      # Yellow
    BPurple='\[\e[1;35m\]'      # Purple
    Reset='\[\e[00m\]'

    # プロンプトにgit各種情報を表示しない
    GIT_PS1_SHOWDIRTYSTATE=
    GIT_PS1_SHOWUPSTREAM=
    GIT_PS1_SHOWUNTRACKEDFILES=
    GIT_PS1_SHOWSTASHSTATE=

    # Add a bright white exit status for the last command
    PS1=""

    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        # PS1+="$BRed\\h "
        PS1+="$BRed"
    else
        # PS1+="$BPurple\\h "
        PS1+="$BPurple"
    fi

    PS1+="\\w"

    PS1+="${Cyan}$(__git_ps1) "

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

export EDITOR='vim'
export SVN_EDITOR='vim'

#-----------
#alias
#-----------

#emacs
alias emacs='emacs -q -nw'
alias e='emacsclient'

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

if [ "$(uname)" == 'Darwin' ]; then
    #ls
    alias ls='ls -hGF'
    alias la='ls -aGhF'
    alias ll='ls -lGhF'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    alias ls='ls -F --color'
    alias la='ls -Fa --color'
    alias ll='ls -Fl --color'
    alias l='ls -Fla --color'
fi

 # 保管
if [ "$(uname)" == 'Darwin' ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    fi
fi

 if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
     shopt -s autocd
     shopt -s cdspell
     shopt -s dotglob
     shopt -s globstar
 fi
