"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nikita Imennov	<imennov@ >
"
"





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When started as "evim", evim.vim will already have done these settings.
"
if v:progname =~? "evim"
  finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Platform-specific initialization
"
if has("unix")
" If used in a *nix environment, use bash as shell
  let &shell="zsh"
  set ttyfast			" smoother output
endif

" If possible, try to use a narrow number column.
if v:version >= 700
	try
		setlocal numberwidth=3
	catch
	endtry
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" have syntax highlighting in terminals which can display colours:
"
if has('syntax') && (&t_Co > 2)
	set background=dark
	syntax on
endif

"set term=builtin_ansi
set term=ansi

if has('mac')
	" terminal can support lots of colors
	set t_Co=256
	colorscheme ir_black
else
	set t_Co=64
endif 

syntax on

"source ~/.vim/filetype.vim

"set columns=80			" Works well for the screen I have
"set lines=54			"   

set nocompatible
filetype indent plugin on		" enable loading the indent file for specific file types with: >


set nobackup			" DON'T keep a backup file
set ruler				" show the cursor position all the time
set showmode

set textwidth=78
set linebreak
set tabstop=4
set shiftwidth=4		" 4 characters for indenting

set backspace=2			" I want to backspace across the lines
set visualbell			" no more beeping

set cindent
set autoindent

set splitright			" Split vertically to the right.
set splitbelow			" Split horizontally below.

"// Ignore at autocompletion:
set wildignore=*.o,*.obj,*.class,*.gif,*.jpg,*.png,*.au,*.wav,*.jar,*.rar,*.zip,*/CVS/,*.~*,*~

"// Ignore with `:edit` command:
set suffixes=.aux,.bak,.dvi,.class,.idx,.ps,.swp,.gz,.tgz,*.rar,.zip,.exe,.dll,.com,.obj,.chm,.out,.COPYING,tags,~,o,.info,.blg



"set autochdir			"auto-change directory to current file
"set autoread			"Set to auto read when a file is changed from the outside


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line definition, version 1
"
set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=[%o]\ %l,%c%V\/%L\ \ %P

" Always show the statusline
set laststatus =2

"
" Status line definition, version 1
"
let &statusline = '%-2.2n %t:%l,%c%V %m'                                           .
\                 '%= [%-10.(%{strlen(&filetype)?&filetype:"unknown"}] %)' .
\                 '%{&encoding}  %4.4{winheight(0)}l   char:%3.3b/0x%-4B '        .
\                 '%<%P'
"\                 '%-10.(%l,%c%V%) %<%P'


" Accuse lines longer than width
set listchars +=tab:\|\ ,precedes:<,extends:>


" Colors for &number
"hi LineNr ctermfg=darkblue ctermbg=lightgrey guibg=darkblue guifg=lightgrey


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search & Replace
"
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase			" ignore case
set smartcase			" but don't ignore it, when search string contains uppercase letters
" show the `best match so far' as search strings are typed:
set incsearch		" do incremental searching
" assume the /g flag on :s substitutions to replace all matches in a line:
"set gdefault

set showmatch			" showmatch: Show the matching bracket for the last ')'?
set matchpairs+=<:>

set autoread "see :h w11

"set cursorline
"hi	cursorline	ctermbg=234


map F	!} fmt 75 78

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window splits

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" don't display one line of the smallest window:
set winminheight=0


" to quickly resize windows with a vertical split, or:
map - <C-W>-
map + <C-W>+


"to resize vertical windows quickly with ALT-SHIFT-[<>]
" NIS: doesn't work?
map <M-<> <C-W><
map <M->> <C-W>>

"map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

highlight Search guibg=LightBlue ctermbg=LightBlue 
highlight ErrorMsg guibg=White guifg=Red 


:hi MyGroup ctermbg=red ctermfg=white
:mat MyGroup /NSI:/





" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
"let xterm16_colormap	= 'soft'

" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
"let xterm16_brightness	= 'high'

"colo xterm16


set diffopt=filler,iwhite	" ignore whitespace changes, but do add blank lines to sync display of files
"set diffopt=filler			" add blank lines to sync display of files



au BufNewFile,BufRead  svn-commit.* setlocal filetype=svn tw=0 noai nocindent

au BufNewFile,BufRead  *.tex 		setlocal nocindent noai tw=0 wrap linebreak number

au BufNewFile,BufRead  *.stdout		set ts=8
au BufNewFile,BufRead  *.stderr		set ts=8

au BufNewFile,BufRead  *.m          setlocal tw=0






""""""""""""""""""""""""""""""
" => File explorer
""""""""""""""""""""""""""""""
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=35

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some files
let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0

"As of version 28 of <syntax/tex.vim>, syntax-based folding of parts, chapters,
"sections, subsections, etc are supported.  Put >
"	let g:tex_fold_enabled=1
"in your <.vimrc>, and :set fdm=syntax.  I suggest doing the latter via a
"modeline at the end of your LaTeX file: >
"	% vim: fdm=syntax
