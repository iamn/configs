path=( $path /usr/local/texlive/2009/bin/universal-darwin )				# TeXLive 2009
path=( $path /Applications/MATLAB_R2007b/bin/ )							# matlab
path=( $path /Applications/Vim.app/Contents/MacOS/ )					# macvim
path=( $path /opt/local/bin /opt/local/sbin )							# DarwinPorts





if [[ -f /opt/local/bin/ls ]]; then

	# For Mac OS X's fink GNU version of LS
	alias ls='/opt/local/bin/ls -lc --color=auto 			   --no-group --human-readable --file-type'
	alias la='/opt/local/bin/ls -lc --color=auto --almost-all --no-group --human-readable --file-type'

else 
	# Darwin, OSX:
	alias ls='ls -lc -G -h -F'		# os x (NSI: builtin)
	alias la='ls -lAF'

fi

alias o='open'






# print out a fortune if it's anywhere in the path
if [ -f `which fortune` ]; then
	fortune -a
fi

