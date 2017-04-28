# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export DO_IP="104.131.0.27"
alias sshdo="ssh jonas@$DO_IP -p 2222"
alias up="cd .."

###########
### H2L ###
###########
export H2L_SETTINGS="$HOME/h2l/config.py"
export PYTHONPATH="$HOME/h2l/h2l/h2l:$PYTHONPATH"
############
### CUDA ###
############
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\ ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
####################
### CAFFE/CAFFE2 ###
####################
export CPLUS_INCLUDE_PATH=/usr/include/python3.5
export PYTHONPATH="$HOME/opt/caffe/python/:$PYTHONPATH"
export PYTHONPATH="$PYTHONPATH:$HOME/opt/caffe2/build"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
################
### ANACONDA ###
################
export PATH="/home/jonas/opt/anaconda/bin:$PATH"

###########
### RVM ###
###########
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

####################
### DRAGONREALMS ###
####################
source $HOME/userpass.sh
export LICH="$HOME/lich/lich.rbw"
export PROFANITY="$HOME/lich/ProfanityFE/profanity.rb"
export PROFANITY_LOGS="$HOME/lich/ProfanityFE/log/"
export SETTINGS_FILE="$HOME/lich/ProfanityFE/.profanity.xml"
export ALT_SETTINGS_FILE="$HOME/lich/ProfanityFE/.alternate.xml"
export TERM=screen-256color

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias jonas="screen -dmS 'lich-jonas' ruby $LICH --dragonrealms --login Jonas --detachable-client=8002 --without-frontend"
alias prof-jonas="ruby $PROFANITY --port=8002 --log-name=Jonas --log-dir=$PROFANITY_LOGS --settings-file=/home/jonas/lich/ProfanityFE/.profanity.xml"
alias crannach="screen -dmS 'lich-crannach' ruby $LICH --dragonrealms --login Crannach --detachable-client=8000 --without-frontend"
alias prof-crannach="ruby $PROFANITY --port=8000 --log-name=Crannach --log-dir=$PROFANITY_LOGS --settings-file=$SETTINGS_FILE"
alias riphik="screen -dmS ruby $LICH --login Riphik --detachable-client=8001 --without-frontend"
alias prof-riphik="ruby $PROFANITY --port=8001 --log-name=Riphik --custom-colors=no --log-dir=$PROFANITY_LOGS --setings-file=$SETTINGS_FILE"
alias prof-dijkstra="ruby $PROFANITY --port=8003 --log-name=Dijkstra --custom-colors=no --log-dir=$PROFANITY_LOGS"
alias dijkstra="screen -dmS 'lich-dijkstra' ruby $LICH --dragonrealms --login Dijkstra --detachable-client=8003 --without-frontend"
alias fallanor="screen -dmS 'lich-fallanor' ruby $LICH --dragonrealms --login Fallanor --detachable-client=8004 --without-frontend --user_id cranchu --password $CR_PW"
alias prof-fallanor="ruby $PROFANITY --port=8004 --log-name=Fallanor --custom-colors=no --log-dir=$PROFANITY_LOGS --settings-file=$ALT_SETTINGS_FILE"
alias falun="screen -dmS 'lich-falun' ruby $LICH --dragonrealms --login Falun --detachable-client=8005 --without-frontend --char_name=Falun --user_id jandersson --password $JA_PW"
alias prof-falun="ruby $PROFANITY --port=8005 --log-name=Falun --custom-colors=no --log-dir=$PROFANITY_LOGS --settings-file=$ALT_SETTINGS_FILE"
alias distress="screen -dmS 'lich-distress' ruby $LICH --dragonrealms --login Distress --detachable-client=8006 --without-frontend"
alias prof-distress="ruby $PROFANITY --port=8006 --log-name=Distress --custom-colors=no --log-dir=$PROFANITY_LOGS --settings-file=$SETTINGS_FILE"
alias dr="tmux attach -d -t dr"
