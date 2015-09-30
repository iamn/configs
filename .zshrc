# -----------------------------------------------
# Set up the Environment
# -----------------------------------------------

#TERM=xterm-256color

export DISPLAY=:0.0
export EDITOR=vim
export PAGER=less
export FIGNORE='.o:.out:~'

MAIL=/dev/null			# i use imap, so local mail is usually junk



path=( $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin )	# basic dirs
path=( $path ~/bin )													# personal bin 

export HISTFILE=~/.zsh/history
export HISTSIZE=3000
export SAVEHIST=3000

# umask 022
export TERM PATH

OS=${OSTYPE%%[0-9.]*}
OSVERSION=${OSTYPE#$OS}



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
. ~/.zsh/completion.defs
# zmv is a batch file rename tool; e.g. zmv '(*).text' '$1.txt'
autoload zmv



# from http://zshwiki.org/home/examples/compsys/colors
autoload colors




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
	auto_pushd \
 	complete_aliases

# -----------------------------------------------
# Shell Aliases
# -----------------------------------------------
source ~/.zsh/alias.zsh

# -----------------------------------------------
#  User-defined Functions
# -----------------------------------------------

# -----------------------------------------------
#  END
# -----------------------------------------------


bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

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





if [[ -f ~/.zsh/local/${OS}.zsh ]]; then
	source ~/.zsh/local/${OS}.zsh
fi


################## COLORISE
#if [[ hash dircolors 2> /dev/null ]]; then
#	echo "exists!"
#	eval $(dircolors ~/.dircolors)
#fi
