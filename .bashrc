# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

#TERM=xterm-88color
TERM=xterm-256color
#TERM=rxvt-unicode-256color

HISTCONTROL=ignoreboth
HISTSIZE=30000
HISTFILESIZE=60000
shopt -s histappend
shopt -s dirspell
shopt -s checkwinsize
shopt -s cdspell

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-*color) color_prompt=yes;;
esac

if [ $(grep -qv SUSE /etc/*release) ]; then
  if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  fi
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    if [ -z "$PS1" ]
    then
      export PS1='\[\e]0;${debian_chroot:+($debian_chroot)}\e[01;32m\]\[\u@\h\][\e[00m: \w\a\]'
    fi
    ;;
*)
    ;;
esac

test -s ~/.alias && . ~/.alias || true
test -s ~/.functions && . ~/.functions || true

export OIO_NS=NS
export OIO_ACCOUNT=myaccount
export OIO_USER=FVE_TEST
export S3_ENDPOINT="http://127.0.0.1:5000/"
export GOPATH=$HOME/src/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/sbin:/sbin:$GOPATH/bin:$HOME/bin

export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=95:ln=32:bn=32:se=36"

## Color man pages
#export LESS_TERMCAP_mb=$(printf "\e[1;31m")
#export LESS_TERMCAP_blink=$(printf "\e[1;31m")
#
#export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
#export LESS_TERMCAP_bold=$(tput bold; tput setaf 1)
#
#export LESS_TERMCAP_me=$(tput sgr0)
## export LESS_TERMCAP_sgr0=$(tput sgr0)
#
#export LESS_TERMCAP_se=$(tput sgr0)
## export LESS_TERMCAP_rmso=$(tput rmso)
#
#export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
#export LESS_TERMCAP_smso=$(printf "\e[1;44;33m")
#
#export LESS_TERMCAP_ue=$(tput sgr0)
#export LESS_TERMCAP_rmul=$(tput rmul)
#
#export LESS_TERMCAP_us=$(printf "\e[4;32;40m")
#export LESS_TERMCAP_smul=$(printf "\e[4;32;40m")

ulimit -c unlimited
