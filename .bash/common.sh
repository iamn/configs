
export EDITOR=`which vim`
export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.bash/history
export HISTFILESIZE=2000
export HISTIGNORE="&:ls:l:[bf]g:exit:history"
export HISTSIZE=8500

export LESS="isR"

os=`uname -s`
if [[ ${os} == "Linux" ]] ; then
    export LANG='en_US.utf8'
elif [[ ${os} == "Darwin" ]] ; then
    export LANG='en_US.UTF-8'
fi


alias vi="vim"
alias vim="vim -X"



#aliases
alias date="date +%a%t%b%t%D%l:%M:%S%p"
alias df='df -h'
alias du='du -h'
alias more="less" # never use more, use less instead
alias unhist='unset HISTFILE'


# colorful commands
alias grep='grep --colour=auto'

# make ls print human readable sizes and append a character to identify items


lsopts=' --human -F -l -A '
if [[ ${os} == "Linux" ]] ; then
    lsopts+='--color=auto'
elif [[ ${os} == "Darwin" ]] ; then
    lsopts+='-G'
fi
alias ls="ls ${lsopts}"
alias l=ls
unset lsopts

alias tree='tree -CFA'

# make all these commands safer
alias cp="cp -vi"
alias mv="mv -vi"
alias rm="rm -vi"

if [[ ${os} == "Linux" ]] ; then
    alias rmdir="rmdir -v"
fi

# make mkdir create long pathnames by default
alias mkdir="mkdir -p"

# no bells
set bell-style none
# notifies about background jobs
set -o notify

# don't clobber files with >
set -o noclobber

# correct minor spelling errors in cd
shopt -s cdspell

# speeds up running commands
shopt -s checkhash

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
shopt -s checkwinsize

# save multiline commands on one line in the hist
shopt -s cmdhist

# Enable history appending instead of overwriting.
shopt -s histappend
# better history handling for failed commands
shopt -s histreedit histverify

#extended pattern matching for filename matching (aka globbing)
shopt -s extglob

#failed globs go to null
shopt -s nullglob

# don't parse $PATH if i haven't typed anything
shopt -s no_empty_cmd_completion



if [[ $TERM =~ '256color' ]]; then
   host_color="\[\e[38;5;$((16 + $(hostname | cksum | cut -c2-4) % 216))m\]";
else
   host_color="\[\e[0;$((31 + $(hostname | cksum | cut -c1-3) % 6))m\]";
fi

export PS1="\[\e[0;32m\]\u@${host_color}\h\[\e[0;32m\] \w \[\e[1;34m\]$\[\e[0m\] "


if [[ -f ${HOME}/.bash/colors.sh ]] ; then
  . ${HOME}/.bash/colors.sh
fi


#ssh() {
#    set "$*"
#    command ssh "$@"
#}


# correct minor spelling errors in cd
shopt -s cdspell
# save multiline commands on one line in the hist
shopt -s cmdhist
# speeds up running commands
shopt -s checkhash
# Enable history appending instead of overwriting.
shopt -s histappend
# better history handling for failed commands
shopt -s histreedit histverify
#extended pattern matching for filename matching (aka globbing)
#shopt -s extglob
# don't parse $PATH if i haven't typed anything
shopt -s no_empty_cmd_completion



###
###settitle() {
###    printf "\033k$1\033\\"
###}
###
###ssh() {
###    settitle "$*"
###    command ssh "$@"
###}
####PS1='$HOST:$PWD$(settitle $HOST:$PWD)$ '
###
###
#### Change the window title of X terminals 
###case $TERM in
###    aterm*|xterm*|rxvt*|Eterm)
###        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
###        ;;  
###    screen)
####        _TITLE='\[\e]0;\u@\h:\w\a\]'
####       PS1="$_TITLE$PS1"
####       unset _TITLE
####PROMPT_COMMAND='$(settitle $HOST:$PWD)'
###PS1 = [\[\033[31;1m\u\[\033[0m@\[\033[34;1m\h\[\033[0m \[\033[32m\w\[\033[0m]#
####       PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
####PROMPT_COMMAND='$(settitle \u@\h:\w)'
####        PROMPT_COMMAND='$(settitle \u@\h:\w)'
###        ;;  
###esac





if [[ -f ${HOME}/.bash/local/factset.bash ]] ; then
  . ${HOME}/.bash/local/factset.bash
fi
