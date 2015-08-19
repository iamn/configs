alias vi='vim'

alias grep='grep --color=auto'

alias ssh='ssh -Y'

alias lo=exit	# damn you VMS!

alias cdp=pushd


lsopts=' --human -F -l -A '
case "${OSTYPE}" in
	(linux|cygwin))
		lsopts+='--color=auto'
		;;
	darwin)
		lsopts+='-G'
		;;
esac
alias ls="ls ${lsopts}"
alias l=ls
unset lsopts



alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"


alias less='less -r'
alias tree='tree -C -A --dirsfirst --noreport -s'


alias xterm='xterm -fn 9x15 -bg black -fg goldenrod1'

alias df='df -h'
alias du='du -h'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'


#-----------------------------------------------------------------------------------------
## Special Root Aliases
#-----------------------------------------------------------------------------------------
[ ${UID} = 0 ] && \
	alias rm='rm -i' && \
	alias mv='mv -i' && \
	alias cp='cp -i'




#-----------------------------------------------------------------------------------------
#																			ZSH-specific
#-----------------------------------------------------------------------------------------
alias mmv='noglob zmv -W'
alias find='noglob find'

alias scp='noglob scp'				# i want to be able to use wildcards in scp!

alias lm='print *(.om[1,10])'		# print 5 most recent normal files (i.e., ".")


# use as  
#	find . -depth | ccp ~/mnt/hippo
alias ccp='cpio --pass-through --preserve-modification-time --make-directories
--verbose'





#-----------------------------------------------------------------------------------------
## Pipe Aliases (Global)
#-----------------------------------------------------------------------------------------
alias -g L='|less'
alias -g G='|grep'
alias -g T='|tail'
alias -g H='|head'
alias -g W='|wc -l'
alias -g S='|sort'
