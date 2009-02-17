
if has("gui_win32")
	"set gfn=Bitstream_Vera_Sans_Mono:h12:cANSI
	set guifont=Consolas:h13:cANSI
	
	"colorscheme darkblue	" Load color scheme {name}
elseif has("gui_mac") || has("gui_macvim")
	" if vim || MacVim
	"set guifont=Monaco:h15
	set guifont=Newport\ Gothic:h15

	colorscheme ir_black
endif



set background=dark
syntax on

set columns=120			" Works well for the screen I have
set lines=45			"   

set cursorline
"hi cursorline guibg=#003399
"hi cursorline guibg=#666699
hi cursorline guibg=#333366
"hi CursorColumn guibg=#333333

map <F6> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F7> <Esc>:setlocal nospell<CR>
"hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
"hi SpellCap guifg=#ffffff guibg=#7f007f
"hi SpellRare guifg=#ffffff guibg=#00007f gui=underline
"hi SpellLocal term=reverse ctermfg=black ctermbg=darkgreen guifg=#ffffff guibg=#7f0000 gui=underline

