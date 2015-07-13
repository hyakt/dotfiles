#------------
#PATH setting
#------------

PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PATH

export EDITOR='emacs -q -nw'
export PS1="\t \h:\w> "
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
alias l.='ls -d .* --color=auto'

#rm
alias rm='rm -i'

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

