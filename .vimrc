"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nikita Imennov	<imennov@ >
"
"
scriptencoding utf-8


set ttyfast			" smoother output

set runtimepath+=~/.vim/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Platform-specific initialization
"
if has("unix")
	set t_Co=256
	set term=xterm-256color

	if !empty( $FDSENV )
		source ~/.vim/local/factset.vim 	" load FactSet-specific files:
	endif


elseif has('mac')
	"set t_Co=256			" terminal can support lots of colors
	colorscheme ir_black
	"set term=builtin_ansi

elseif has("vms")
	set nobackup	      " does not create *.*_ backup files
	set nowritebackup   " does not have any purpose on VMS.  It's the default.

	set t_Co=64

	" VMS allows '$' in C, so make sure that doesn't mess up our code:
	autocmd FileType c,cpp,cxx	set iskeyword+=$


	" map opening prev/next version of the current file:
	map <C-n> <ESC>:call VersionNext()<Return>
	map <C-p> <ESC>:call VersionPrev()<Return>


	if !empty( $FDS_TABLE_NUMBER" )
		source ~/_vim/local/factset.vim 	" load FactSet-specific files:
	endif

endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" have syntax highlighting in terminals that can display colours:
"
if has('syntax') && (&t_Co > 2)
	set background=dark
	syntax on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &encoding == "utf-8"
	" showbreak	string to put before wrapped screen lines
	exe "set showbreak=\u21b3"

	exe "set listchars=nbsp:\u2423,tab:\u2595\u2014,trail:\u02d1,precedes:\u2026,extends:\u2026,eol:\ub6"
	if v:version > 704
		"exe "set listchars+=space:\u2423"
		exe "set listchars+=space:\ub7"
		exe "set listchars+=conceal:\u22ef"
	endif

	"exe "set fillchars=vert:\u2502,fold:\u2500,diff:\u2014"
else
	set showbreak="+"
	set listchars=eol:$,trail:-,tab:\|\ ,extends:>,precedes:<,conceal:+

endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If possible, try to use a narrow number column.
if v:version >= 700
	try
		setlocal numberwidth=3
	catch
	endtry
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



set nocompatible		" don't bother staying compatible w/vi
filetype indent plugin on	" enable loading the indent file for specific file types with: >


set nobackup			" DON'T keep a backup file
set ruler			    " show the cursor position all the time
set showmode

set linebreak

set backspace=2			" I want to backspace across the lines
set visualbell			" no more beeping

set cindent
set autoindent

set splitright			" Split vertically to the right.
set splitbelow			" Split horizontally below.

"// Ignore at autocompletion:
set wildignore=*.o,*.obj,*.class,*.exe,*.gif,*.jpg,*.png,*.au,*.wav,*.jar,*.rar,*.zip,*/CVS/,*.~*,*~
set wildmenu
set wildmode=longest,list

"// Ignore with `:edit` command:
set suffixes=.aux,.bak,.dvi,.class,.idx,.ps,.swp,.gz,.tgz,*.rar,.zip,.exe,.dll,.com,.obj,.chm,.out,.COPYING,tags,~,o,.info,.blg



"set autochdir			"auto-change directory to current file
"set autoread			"Set to auto read when a file is changed from the outside


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line definition, version 1
"
set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=[%o]\ %l,%c%V\/%L\ \ %P

"set laststatus =2		" Always show the statusline

"
" Status line definition, version 1
"
let &statusline = '%-2.2n %<%F%:%l,%c%V %m'                                           .
\                 '%= [%-10.(%{strlen(&filetype)?&filetype:"unknown"}] %)' .
\                 '%{&encoding}  %4.4{winheight(0)}l   char:%3.3b/0x%-4B '        .
\                 '%<%P'
"\                 '%-10.(%l,%c%V%) %<%P'

""set statusline +=%1*\ %n\ %*            "buffer number
""set statusline +=%5*%{&ff}%*            "file format
""set statusline +=%3*%y%*                "file type
""set statusline +=%4*\ %<%F%*            "full path
""set statusline +=%2*%m%*                "modified flag
""set statusline +=%1*%=%5l%*             "current line
""set statusline +=%2*/%L%*               "total lines
""set statusline +=%1*%4c\ %*             "column number
""set statusline +=%2*0x%04B\ %*          "character under cursor


"
" statusline, v2:
""set statusline=
""set statusline +=%-2.2n            "buffer number
""set statusline +=%4*\ %<%F%*            "full path
""set statusline +=%1*%=%5l%*             "current line
""set statusline +=%1*%4c\ %*             "column number
""set statusline +=%2*%m%*                "modified flag
""set statusline +=%3*%y%*                "file type
""set statusline +=%5*%{&ff}%*            "file format
""set statusline +=%2*0x%04B\ %*          "character under cursor
""set statusline +=%2*/%L%*               "total lines
""set statusline +=%<%P                   "percent






" Colors for &number
"hi LineNr ctermfg=darkblue ctermbg=lightgrey guibg=darkblue guifg=lightgrey


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search & Replace
"
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase			" ignore case
set smartcase			" but don't ignore it, when search string contains uppercase letters


set incsearch			" show the `best match so far' as search strings are typed; aka do incremental searching

" assume the /g flag on :s substitutions to replace all matches in a line:
"set gdefault

set showmatch			" showmatch: Show the matching bracket for the last ')'?
set matchpairs+=<:>

set autoread "see :h w11

set foldmethod=syntax
set nofoldenable

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

map <F11> :let &background = ( &background == "dark"? "light" : "dark" )<CR>


"set diffopt=filler,iwhite	" ignore whitespace changes, but do add blank lines to sync display of files
set diffopt=filler			" add blank lines to sync display of files


" This command will change the 'completeopt' option so that Vim's popup menu doesn't select
" the first completion item, but rather just inserts the longest common text of all matches;
" and the menu will come up even if there's only one match. (The longest setting is responsible
" for the former effect and the menuone is responsible for the latter.)
set completeopt=longest,menuone



au BufNewFile,BufRead  svn-commit.* setlocal filetype=svn tw=0 noai nocindent

au BufNewFile,BufRead  *.tex 		setlocal nocindent noai tw=0 wrap linebreak number

au BufNewFile,BufRead  *.stdout		set ts=8
au BufNewFile,BufRead  *.stderr		set ts=8

au BufNewFile,BufRead  *.m        setlocal tw=0


au FileType             perl      setlocal makeprg=perl\ -c\ %\ $*
au FileType             perl      setlocal errorformat=%f:%l:%m

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1
let perl_fold=1
let perl_fold_blocks=1
let perl_include_pod=1


let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


"
" Fix up syntax
"
highlight Search      guibg=LightBlue ctermbg=LightBlue 
highlight ErrorMsg    ctermbg=white ctermfg=red guibg=White guifg=Red 

highlight MyGroup     ctermbg=LightBlue ctermfg=black
:mat MyGroup /NSI\|nimennov\|NIMENNOV\|nikita:/



""""""""""""""""""""""""""""""
" => Alternate plugin (a.vim)
""""""""""""""""""""""""""""""
let g:alternateSearchPath = "$ref,sfr:../source,sfr:../src,sfr:../include,sfr:../inc"





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
