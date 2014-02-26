# -----------------------------------------------
# Set up the Environment
# -----------------------------------------------

#TERM=screen
#COLORTERM=yes
#TERM=xterm-256color


DISPLAY=:0.0
EDITOR=vim
PAGER=less
FIGNORE='.o:.out:~'

MAIL=/dev/null			# i use imap, so local mail is usually junk




################## COLORISE
[ -f ~/.dircolors ] && [ -f /opt/local/bin/dircolors ] && eval $(/opt/local/bin/dircolors ~/.dircolors) 


#Quick-and-Dirty: grep --color. 1;32 is green, 1;36 is cyan default is red; see the ansimodes command above or remove the GREP_COLOR part. A better way to do it is to add this to your ~/.bashrc (or as shown in the titlebar section below):

if echo hello|grep --color=auto l >/dev/null 2>&1; then
  export GREP_OPTIONS='--color=auto' GREP_COLOR='1;36'
fi

path=( $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin )	# basic dirs
path=( $path ~/bin )													# personal bin 

export HISTFILE=~/.zsh/history
export HISTSIZE=3000
export SAVEHIST=3000

# umask 022
#export TERM EDITOR PAGER CVSROOT FIGNORE DISPLAY LS_COLORS COLORTERM PATH
export TERM EDITOR PAGER FIGNORE LS_COLORS PATH



# -----------------------------------------------
# Set up the prompt and window title
# -----------------------------------------------

# root prompt
PROMPT=$(echo '%{\e[1;31m%}%~%# %{\e[0m%}')
RPROMPT=$(print '%{\e[1;32m%}%n@%m%{\e[0m%}')

# window title for putty/xterm & screen
precmd()
{
	case $TERM in
		xterm*)
			echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD/$HOME/~}\007"
			;;
		screen)
			echo -ne "\033_${USER}@${HOST%%.*}:${PWD/$HOME/~}\033\\"
			;;
	esac
} 



# -----------------------------------------------
# For screen, let me know if there are detached sessions
# -----------------------------------------------
# Login greeting ------------------
if [ "$TERM" = "screen" -a ! "$SHOWED_SCREEN_MESSAGE" = "true" ]; then
	detached_screens=`screen -list | grep Detached`
	if [ ! -z "$detached_screens" ]; then
	    echo "+---------------------------------------+"
		echo "| Detached screens are available:       |"
		echo "$detached_screens"
		echo "+---------------------------------------+"
	else
		echo "[ screen is activated ]"
	fi

	export SHOWED_SCREEN_MESSAGE="true"
fi


# -----------------------------------------------
# Load zsh modules
# -----------------------------------------------

# compinit initializes various advanced completions for zsh
autoload -U compinit && compinit 
# zmv is a batch file rename tool; e.g. zmv '(*).text' '$1.txt'
autoload zmv



# -----------------------------------------------
# Set up zsh autocompletions
# -----------------------------------------------


# from http://zshwiki.org/home/examples/compsys/colors
autoload colors

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32




# case-insensitive tab completion for filenames (useful on Mac OS X)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# General completion technique
zstyle ':completion:*' completer _complete _correct _approximate _prefix
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete

zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric


# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# Describe each match group.
#zstyle ':completion:*:descriptions' format "%B---- %d%b"
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'

# Messages/warnings format
#zstyle ':completion:*:messages' format '%B%U---- %d%u%b' 
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
#zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'



 
# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes



# -----------------------------------------------
# Set up completion for hostnames
# -----------------------------------------------
###
###if [[ "$ZSH_VERSION_TYPE" == 'new' ]]; then
###  : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}}
###else
###  # Older versions don't like the above cruft
###  _etc_hosts=()
###fi
###

#hosts=(
#	"$_etc_hosts[@]"
#
#	localhost
#	example.com
#	# snip
#)

#zstyle ':completion:*' hosts $hosts

my_accounts=(
	user@example.com
	# snip
)

zstyle ':completion:*:my-accounts' users-hosts $my_accounts



#### add the hostnames from ~/.ssh/known_hosts
###local _myhosts
###if [[ -f $HOME/.ssh/known_hosts ]]; then
###	_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
###	zstyle ':completion:*' hosts $_myhosts
###fi

# complete only dirs (or symlinks to dirs in some cases) for certain commands
compctl -g '*(/)' rmdir dircmp
compctl -g '*(-/)' cd chdir dirs pushd


compctl -j -P '%' -x 's[-] p[1]' -k signals -- kill
compctl -j -P '%' fg bg wait jobs disown
compctl -A shift
compctl -caF type whence which
compctl -F unfunction
compctl -a unalias
compctl -v unset typeset declare vared readonly export integer
compctl -e disable
compctl -d enable


zstyle ':completion:*:(vi|vim):*' ignored-patterns '*.o'
# From zshwiki.org

#Prevent CVS files/directories from being completed :
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# Same for lost+found directories
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'

# Ignore what's already in the line With commands like `rm/kill/diff' it's
# annoying if one gets offered the same filename again even if it is
# already on the command line. To avoid that:
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# With helper functions like:
xdvi() { command xdvi ${*:-*.dvi(om[1])} }
#you can avoid having to complete at all in many cases, but if you do,
#you might want to fall into menu selection immediately and to have the
#words sorted by time:
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time


#------------------------------------------------------------------------------
# Run ghostscript on postscript files, but if no postscript file matches what
# we already typed, complete directories as the postscript file may not be in
# the current directory.
compctl -/g '*.(e|E|)(ps|PS)' \
	gs ghostview nup psps pstops psmulti psnup psselect
#------------------------------------------------------------------------------
# Similar things for tex, texinfo and dvi files.
compctl -/g '*.tex*' {,la,gla,ams{la,},{g,}sli}tex texi2dvi
compctl -/g '*.dvi' xdvi dvips

#------------------------------------------------------------------------------
#A possibly better solution would  be to complete on the tex file
#first, but would still complete on the other files if there is no
#other completion :
#zstyle ':completion::*:(vi|vim):*' file-patterns '*.tex' '*'
#
#...that way, if there is a tex file and you hit tab, zsh will complete
#on the tex file even if there are other acceptable completions.
#
#
#It's also possible, and probably even better, to complete first on
#whatever is not one of the outputs of latex, while retaining the
#completion on them failing that.
zstyle ':completion::*:(vi|vim):*'	file-patterns '*.tex' '*~*.(aux|dvi|log|bbl|blg|idx|pdf|rel|out)' '*'

zstyle ':completion::*:open:*'		file-patterns '*.pdf' '*'
zstyle ':completion::*:open:*'		menu yes select
zstyle ':completion::*:open:*'		file-sort time


compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'



# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"


zstyle ":completion:*:*:$command:*:$tag" list-colors "=(#b)\
	=$zshregex_with_brackets\
	=$default_color_escape_number\
	=$color_number_for_letters_in_first_bracket-pair\
	=$color_number_for_letters_in_second_bracket-pair"     "..."





# -----------------------------------------------
# Set zsh options
# -----------------------------------------------

setopt \
	no_beep \
	correct \
	auto_list \
	complete_in_word \
	extended_glob \
	PUSHD_IGNORE_DUPS \
	HIST_IGNORE_DUPS \
	LONG_LIST_JOBS \
	PUSHD_SILENT \
	zle \
	auto_pushd 
#	complete_aliases \

# -----------------------------------------------
# Shell Aliases
# -----------------------------------------------
source ~/.zsh/alias.rc

alias lm='print *(.om[1,10])'		# print 5 most recent normal files (i.e., ".")

#source ~/.zsh/zkbd.zsh

# -----------------------------------------------
#  User-defined Functions
# -----------------------------------------------

# -----------------------------------------------
#  END
# -----------------------------------------------


#bindkey "[A" history-beginning-search-backward
#bindkey "[B" history-beginning-search-forward
#bindkey "[C" forward-char
#bindkey "[D" backward-char
bindkey "^[[B" down-line-or-search
bindkey "^[[A" up-line-or-search      


# bind SHIFT-TAB for completion from history
bindkey "[Z" _history-complete-older

bindkey "[1~" beginning-of-line
bindkey "[4~" end-of-line






# -----------------------------------------------
# development tools
# -----------------------------------------------
#export svn_ssh="svn+ssh://imennov@icsl.washington.edu/home/imennov/repos/software"
#export svn="file:///home/imennov/repos/software"

#export itk="/usr/local/share/Insight/Examples"
#export VTK_DIR="/usr/local/share/VTK/lib/vtk/"




# -----------------------------------------------
# Lab-specific variables
# -----------------------------------------------


if [ $TG_HOME ]; then
	source ~/.zsh/local/teragrid.zsh
else
	source ~/.zsh/local/xgrid.zsh

fi


OS=${OSTYPE%%[0-9.]*}
OSVERSION=${OSTYPE#$OS}

if [[ $OS == "darwin" ]]; then

	source ~/.zsh/local/darwin.zsh

elif [[ $OS == "linux" ]]; then

	source ~/.zsh/local/linux.zsh

fi
