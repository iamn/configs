#-----------------------------------------------------------------------------------------
# Common environmental settings:
#-----------------------------------------------------------------------------------------

export EDITOR=vim

#-----------------------------------------------------------------------------------------
# Shell aliases:
#-----------------------------------------------------------------------------------------

alias lo=exit	# damn you VMS!
alias cdp=pushd


# make ls print human readable sizes and append a character to identify items
OS="${OSTYPE%%[0-9.]*}"
case "${OS}" in
	(linux-gnu|cygwin))
		lsopts=' --human-readable --file-type -l --almost-all '
		lsopts+=' --color=auto '	# color
		;;
	darwin)		# aka OS X
		lsopts=' -h -F -l -A '	# same order as gnu above
		lsopts+=' -G '	# color
		lsopts+=' -o '	# show file attributes
		;;
esac
alias ls="ls ${lsopts}"
alias l=ls
unset lsopts
unset OS




alias grep='grep --color=auto'

alias less='less -r'
alias tree='tree -C -A --dirsfirst --noreport -s'

alias xterm='xterm -font 9x15 -bg black -fg goldenrod1'

alias quota='quota --human-readable --quiet-refuse'
alias df='df -h'
alias du='du -h'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'


#-----------------------------------------------------------------------------------------
## Special Root Aliases
#-----------------------------------------------------------------------------------------
[ ${UID} = 0 ] && \
	alias rm='rm -i' && \
	alias mv='mv -i' && \
	alias cp='cp -i'



#-----------------------------------------------------------------------------------------
## Do not expand wildcards for these commands:
#-----------------------------------------------------------------------------------------
alias find='noglob find'
alias scp='noglob scp'				# i want to be able to use wildcards in scp!



#-----------------------------------------------------------------------------------------
## aliases as shortcuts
#-----------------------------------------------------------------------------------------

# use as  
#	find . -depth | ccp ~/mnt/hippo
alias ccp='cpio --pass-through --preserve-modification-time --make-directories --verbose'

alias strip_color='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'

alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
