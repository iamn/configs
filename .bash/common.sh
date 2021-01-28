
export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.bash/history
export HISTFILESIZE=2000
export HISTIGNORE="&:ls:l:[bf]g:exit:history"

export LESS="isR"


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


if [[ -f ${HOME}/.bash/alias.sh ]] ; then
  . ${HOME}/.bash/alias.sh;
fi
