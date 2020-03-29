# PATH
# マシン個別PATHの設定は.bash_profileに記載する
#----------
# sbin
PATH="$PATH:/usr/local/sbin"
# my shell
PAHT="$PATH:$HOME/.bin/"
# anyenv
PATH="$HOME/.anyenv/bin:$PATH"

# Env
#----------
if type anyenv > /dev/null 2>&1; then
    eval "$(anyenv init -)"
fi
if type direnv > /dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi

# golang
PATH="$PATH:$GOENV_ROOT/bin:$GOPATH/bin"

export PATH

# Editor
#----------
export EDITOR='vim'
export SVN_EDITOR='vim'

# Prompt
#----------
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

    PS1+="\\w "

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

# alias
#----------
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

# 補完
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

#emacs
alias emacs='emacs -q -nw'
alias e='emacsclient'

# git
alias g='git'

# docker
alias d='docker'
