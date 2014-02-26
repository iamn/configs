"
" FactSet-specific:
"
"
"


if has("vms")
  "
  " VMS
  "

  source s:[nimennov._vim.plugins]a.vim

  set runtimepath+=s:[nimennov._vim]
  set runtimepath+=s:[nimennov._vim.colors]

  set keywordprg=perl\ e0:[scripts]groksearch.pl

  "
  " From atubbs' msg:
  "
  set makeprg=makefds
  set errorformat=%C\ %.%#,%A%p^,%C%%CXX-%t-%m,%Cat\ line\ number\ %l\ in\ file\ %f,%+GTEST\ is\ now\ UPTODATE\ for,%-G%.%#

else
  "
  " FONIX
  "
  set makeprg=~/bin/rakefds_nocolor
  set runtimepath+=~/local/vim73/runtime/

  source /home/fonix/prd_progs/tools/conf/vim/fds.vimrc
endif

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nu




" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty. 
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers. 
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen. 
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"set t_Co=256
if &diff
    colorscheme inkpot
    "colorscheme default
else
    "colorscheme herald
    colorscheme molokai
endif
