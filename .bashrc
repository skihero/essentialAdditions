# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias man8="cd /usr/share/man/man8"
export PS1='[\u@\h \w]\$ '

alias vi="vim" 
alias ll="ls -la" 

PATH=$PATH:$HOME/bin:/sbin:/usr/sbin
export PATH

alias la='ls -A'
alias lt='ls -ltr'
alias ltr='ls -ltru|tail'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias path='echo -e ${PATH//:/\\n}'
alias h='fc -l' 
set -o emacs 

export HISTCONTROL=ignoreboth
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

cd ~

alias j='jobs -l'

alias hub="export GIT_CONFIG=/home/kishore/github/.gitconfig" 

# Cust functions 
function yinstall(){ 
sudo yum -y install $1  
}

function rpmext (){ 
rpm2cpio $1  |cpio -i --make-directories --verbose
} 


