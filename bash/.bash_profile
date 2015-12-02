# my batman logo
cat ~/env/batman

#export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/lib/stlink"

#if [ -f `brew --prefix`/etc/bash_completion ]; then
		#. `brew --prefix`/etc/bash_completion
#fi

# ORIGINAL gcc/g++ links
# /usr/bin/gcc -> llvm-gcc-4.2
# /usr/bin/g++ -> llvm-g++-4.2
# /opt/local/bin/gcc -> /opt/local/bin/gcc-mp-4.7
# /opt/local/bin/g++ -> /opt/local/bin/g++-mp-4.7
alias gcc='gcc-4.9'
alias g++='g++-4.9'
alias c++='c++-4.9'

alias ls="ls -G"
alias ll="ls -Gl"
alias :q="exit"

function cl () { cd "$@" && ls; }
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

##
# Your previous /Users/batman/.bash_profile file was backed up as /Users/batman/.bash_profile.macports-saved_2014-01-14_at_03:53:53
##

# MacPorts Installer addition on 2014-01-14_at_03:53:53: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# changing colors: \e[ - indicates the beginning of color prompt
# different info:
#		\u - username
# 	\h - hostname
# 	\W - base name of the current working directory
#		\t - time in hh:mm:ss form
# Color Variables
#BLUE='\[\e[0;34m\]';
#RED='\[\e[0;31m\]';
#YELLOW='\[\e[1;33m\]';
#GREEN='\[\e[1;32m\]';
#NORMAL='\[\e[0m\]';

BLUE='\e[0;34m';
RED='\e[0;31m';
YELLOW='\e[1;33m';
GREEN='\e[1;32m';
NORMAL='\e[0m';
CYAN='\e[0;36m';

#export \h:\W \u\$ DEFAULT
#export PS1='\e[1;33m\]\h:\W \u\$\e[0m\] '
#export PS1='\[\e[1;33m\]\h:\[\e[0;33m\]\u \[\e[0;34m\]\W\[\e[1;33m\](^_^):\[\e[0m\] '
#export PS1="$BLUE[$GREEN\t$BLUE]$NORMAL:$YELLOW\u $BLUE\W$YELLOW(^_^):$NORMAL "
#export PS1="\e[0;36m┌─$YELLOW (^_^)$NORMAL:$CYAN[$GREEN\t$CYAN]$NORMAL:$YELLOW\u $BLUE\w$NORMAL:\n\e[0;36m└──> $NORMAL"
source ~/env/.git-prompt.sh
export PS1="\e[0;36m┌─$YELLOW (^_^)$NORMAL:$CYAN[$GREEN\t$CYAN]$NORMAL:$YELLOW\u $BLUE\w$RED\$(__git_ps1)$NORMAL:\n\e[0;36m└──> $NORMAL"

#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01;36:quote=01'
