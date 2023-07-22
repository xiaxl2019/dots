# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [[ $TERM =~ xterm* ]]
then
    PS1=""
    PS1+="\[$(tput bold)$(tput setaf 1)\]["
    PS1+="\[$(tput setaf 2)\]\u"
    PS1+="\[$(tput setaf 3)\]@"
    PS1+="\[$(tput setaf 4)\]\h "
    PS1+="\[$(tput setaf 5)\]\w"
    PS1+="\[$(tput setaf 1)\]]"
    PS1+="\[$(tput sgr0)\] "
fi

if [ -f /usr/share/fzf/shell/key-bindings.bash ]
then
    source /usr/share/fzf/shell/key-bindings.bash
fi

if [ -f /usr/share/autojump/autojump.bash ]
then
    source /usr/share/autojump/autojump.bash
fi

HISTSIZE=10000                 # increase history size (default is 500)
HISTFILESIZE=$(($HISTSIZE*2))  # increase history file size (default is 500)
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoreboth:erasedups

PROMPT_COMMAND="${PROMPT_COMMAND}; history -n; history -w; history -c; history -r"

function mycd() {
    if [[ $# == 0 ]]; then
        cd ~
        return
    fi

    cd "$1" && return

    read -p "enter [y] to mkdir it: " prompt
    if [[ $prompt == "y" ]]; then
        mkdir "$1" && cd "$1"
    fi
}

alias cd='mycd'

alias ls='ls -v --color=auto --time-style=long-iso'
alias ll='ls -l'
alias l.='ls -d .*'
alias la='ls -A'

alias cp='cp -p'
alias tree='tree -v'

alias man='man -L en'
alias tldr='tldr -L en'

alias myip='ip -br -c a'
alias cpuinfo='cat /proc/cpuinfo | grep MHz'
alias meminfo='sudo dmidecode -t memory | grep MT'

alias dul='du * -sch | sort -h'
alias duf='duf -only local'

if [ -d ~/data2/mybin ]
then
    export PATH=$PATH:~/data2/mybin
fi

complete -o nospace -W '--exclude=' a2sync.sh

###############################
# EGSnrc environment settings #
###############################
# export EGS_CONFIG=/home/xiaxl/data2/egs/EGSnrc-master/HEN_HOUSE/specs/linux64.conf
# export EGS_HOME=/home/xiaxl/data2/egs/EGSnrc-master/egs_home/
# . /home/xiaxl/data2/egs/EGSnrc-master/HEN_HOUSE/scripts/egsnrc_bashrc_additions

# source ~/data2/geant4/geant4-v11.0.2-install/bin/geant4.sh
# export QT_QPA_PLATFORM=xcb
