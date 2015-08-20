"
" Setup platform-specific options for gui-based vim
"
if has("gui_running")         " redundant?

" WINDOWS
	if has("gui_win32")
		"set gfn=Bitstream_Vera_Sans_Mono:h12:cANSI
		set guifont=Consolas:h13:cANSI
		
		colorscheme darkblue			" Load color scheme {name}
		set background=dark			" since we set colorscheme based on platform, do same for bg

" MAC OSX
	elseif has("gui_mac") || has("gui_macvim")
		"set guifont=Monaco:h15
		set guifont=Newport\ Gothic:h15

		colorscheme ir_black			" Load color scheme {name}
		set background=dark			" since we set colorscheme based on platform, do same for bg

		" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
		"let xterm16_colormap	= 'soft'

		" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
		"let xterm16_brightness	= 'high'

		"colo xterm16




" GTK
	elseif has("gui_gtk2")
		set guifont=Courier\ New\ 11
		"set guifont=Envy\ Code\ R\ 11

" ???
	elseif has("gui_photon")
		set guifont=Courier\ New:s11

" KDE
	elseif has("gui_kde")
		set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0

" Generic X11 (incl. VMS)
	elseif has("gui_motif")
		"set guifont=-misc-fixed-medium-r-normal--12-120-100-100-c-90-iso8859-1		" doesn't work?
		set guifont=-misc-fixed-medium-r-normal--15-140-75-75-c-90-iso8859-1		" normal
		"set guifont=-misc-fixed-medium-r-normal--20-200-75-75-c-100-iso8859-1		" big

		colorscheme darkblue			" Load color scheme {name}
		set background=dark			" since we set colorscheme based on platform, do same for bg
	endif
endif


"set sbr=Â¬		" showbreak	string to put before wrapped screen lines
set sbr=¬		" showbreak	string to put before wrapped screen lines
syntax on

set columns=120			" Works well for the screen I have
set lines=40			"   

set cursorline
"hi cursorline guibg=#003399
"hi cursorline guibg=#666699
hi cursorline guibg=#333366
"hi CursorColumn guibg=#333333



"
" SPELL-CHECKING:
"
map <F6> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F7> <Esc>:setlocal nospell<CR>

"hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
"hi SpellCap guifg=#ffffff guibg=#7f007f
"hi SpellRare guifg=#ffffff guibg=#00007f gui=underline
"hi SpellLocal term=reverse ctermfg=black ctermbg=darkgreen guifg=#ffffff guibg=#7f0000 gui=underline


"
" PRINTING OPTIONS
"
set printoptions=paper:letter,left:5pc,number:y,portrait:y			" add "portrait:n" for landscape
