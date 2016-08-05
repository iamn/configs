# -----------------------------------------------
# Set up the Environment
# -----------------------------------------------

EDITOR=vim
PAGER=less
FIGNORE='.o:.out:~'

#DISPLAY=:0.0
#DISPLAY=$REMOTEHOST:0.0
#DISPLAY=128.208.15.7:0.0

MAIL=/dev/null			# i use imap, so local mail is usually junk



path=( $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin )	# basic dirs
path=( $path ~/bin )														# personal bin 

export HISTFILE=~/.zsh/history
export HISTSIZE=3000
export SAVEHIST=3000

# umask 022
export TERM EDITOR PAGER FIGNORE LS_COLORS PATH



# -----------------------------------------------
# Set up the prompt and window title
# -----------------------------------------------

# from http://zshwiki.org/home/examples/compsys/colors
autoload -U colors


# root prompt
#PROMPT="%B%(?..[%?] )%b%n@%U%m%u> "
PROMPT="%K{magenta}%n@%m%k %# %b%f%k"
RPROMPT="%F{green}%~%f"


# -----------------------------------------------
# Load zsh modules
# -----------------------------------------------

# compinit initializes various advanced completions for zsh
#autoload -U compinit && compinit 
autoload compinit
# zmv is a batch file rename tool; e.g. zmv '(*).text' '$1.txt'
autoload zmv



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
source ~/.zsh/alias.zsh

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



################## COLORISE
# GNU Colors
#[ -f ~/.dircolors ] && [ $+commands[dircolors] ] && eval $(dircolors ~/.dircolors) 



# -----------------------------------------------
# Site-specific scripts
# -----------------------------------------------


if [ $TG_HOME ]; then
	source ~/.zsh/local_teragrid.zsh
elif [[ $OS == "darwin" ]]; then
	source ~/.zsh/local_xgrid.zsh
fi


if [[ $OS == "darwin" ]]; then
	source ~/.zsh/local/darwin.zsh
elif [[ $OS == "linux" ]]; then
	source ~/.zsh/local/linux.zsh
elif [[ $OS == "Windows_NT" ]]; then
	source ~/.zsh/local/cygwin.zsh
fi
