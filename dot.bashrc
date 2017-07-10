#!/usr/bin/env bash

# Suggested .bashrc for MAC OS X
# create by jdelatorre - 05 NOV 2014 / 17 NOV 2015 / 18 AUG 2016 / JAN 2017

# .bashrc - - Mac Laptop

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/mybin

alias now=' date +"%Y-%m-%d:%T"'

#
 export HISTTIMEFORMAT='%F %T  '  # place Time Stamp info into history out

# don't put duplicate lines or lines starting with space in the history.
 HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
 HISTSIZE=1000
 HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
color_prompt=yes
    else
color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Window Dimensions
alias windim='echo $(tput cols)x$(tput lines)'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

# I'm not sure, but I think the LSCOLORS and .dircolors conflict with each other
LS_COLORS='di=35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=34'
  export LS_COLORS

# Set vim as default
  alias vi=vim
  export VISUAL='vim'

# tell grep to highlight matches
 	export GREP_COLOR='1;31'                   # GREP_COLOR is deprecated
 	export GREP_COLORS='1;31'
 	export GREP_OPTIONS='--color=auto'

  # brew tap homebrew/dupes; brew install grep
  alias  grep='ggrep --color=always'
  alias fgrep='fgrep --color=always'
  alias egrep='egrep --color=always'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    /etc/bash_completion
  fi
fi

#
 alias ll='ls -l | ccze -A'

 alias lw='ls -C | ccze -A'
 alias l.='ls -lart | ccze -A'
 alias cls='clear'

 alias mkdir="mkdir -pv"        # flag to make any necessary parent directories

# Create a new set of commands
 alias path='echo -e ${PATH//:/\\n}'
 alias nowd='date +" %Y-%m-%d.%H.%M"'
 #alias list=history

# Set vim as default
 alias vi=vim

# Stop after sending count ECHO_REQUEST packets #
 alias ping='ping -c 3'

# confirmation #
 alias mv='mv -i'
 alias cp='cp -i'
 alias ln='ln -i'

# Process GREP - fix kludge
 function ppgrep() { pgrep "$@" | xargs ps -fp 2> /dev/null; }
 alias pgrep='ppgrep'

#
 alias srm='/usr/local/Cellar/srm/1.2.15/bin/srm -D'
# requires brew install srm

# HighLighter Credentials - https://docs.google.com/document/d/1kZTfThvtU9ByQx7mvlHLKp_IN3QyMotcXFVHCvDCcIk/edit
 source "$HOME/mybin/h.sh"

export H_COLORS_FG="bold black on_rgb520","bold red on_rgb025"
export H_COLORS_BG="underline bold rgb520","underline bold rgb025"

# AWS Credentials
 source "$HOME/.bash-func.sh"

# AWS Credentials
 source "$HOME/.awseasy/awseasy"
 source "$HOME/.aws-keys"
