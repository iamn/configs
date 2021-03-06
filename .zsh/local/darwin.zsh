path=( $path /usr/local/texlive/2010/bin/universal-darwin )				# TeXLive 2010
path=( $path /Applications/MATLAB_R2010b/bin/ )							# matlab
path=( $path /Applications/Vim.app/Contents/MacOS/ )					# macvim





if [[ -f /opt/local/bin/ls ]]; then
	path=( $path /opt/local/bin /opt/local/sbin )						# DarwinPorts

	# For Mac OS X's fink GNU version of LS
	alias ls='ls -lc --color=auto 			   --no-group --human-readable --file-type'
	alias la='ls -lc --color=auto --almost-all --no-group --human-readable --file-type'

else 
	# Darwin, OSX:
	alias ls='ls -lc -G -h -F'		# os x (NSI: builtin)
	alias la='ls -lAF'

fi

alias o='open'




# print out a fortune if it's anywhere in the path
if [ $+commands[fortune] ]; then
	fortune -a
fi
