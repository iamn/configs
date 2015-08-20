alias vi='vim'

alias grep='grep --color=auto'

alias ssh='ssh -Y'

alias date="date +%a%t%b%t%D%l:%M:%S%p"
alias more="less" # never use more, use less instead
alias unhist='unset HISTFILE'

alias lo=exit	# damn you VMS!

alias cdp=pushd


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


alias tree='tree -C -A --dirsfirst --noreport -s'


alias df='df -h'
alias du='du -h'
alias mv='mv -vi'
alias cp='cp -vi'
alias rm='rm -vi'

if [[ ${os} == "Linux" ]] ; then
    alias rmdir="rmdir -v"
fi


alias strip_color='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
