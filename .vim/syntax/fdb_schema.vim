" Vim syntax file
" Language:   FDS's fdb schema files
" Maintainer: nimennov, i guess
" Latest Revision: Thu Aug 16 12:04:31 EDT 2012
"
" NOTE:
"      This file was rather hastily-written, so feel free to modify & fix, 
" but this is probably not the best file to learn from.  :/
"

if exists("b:current_syntax")
  finish
endif


" shut case off
syn case ignore



syn keyword schemaTodo        contained TODO FIXME XXX NOTE
syn match   schemaComment     "^//.*$" contains=schemaTodo

syn keyword fieldType         double int char float id rotate_id
syn keyword fieldIter         2d 3d none
syn keyword fieldFreq         day random month year quarter

" probably should match =\d as well, but oh well...

syn region schemaPrompt       start='<' end='>'
syn region schemaString       start='"' end='"' contained

syn match   fieldName         /^field=\S*;/hs=s+6,he=e-1
syn match   schemaName        /^schema=\S*;/hs=s+7,he=e-1

syn match   missingSemiCol    /^\a\+.*[^;]$/


hi def link schemaTodo        Todo
hi def link schemaComment     Comment
"hi def link schemaBlockCmd    Statement  unused
"hi def link schemaHip         Type       unused
hi def link schemaString      Constant
hi def link schemaPrompt      Constant

hi def link fieldName         PreProc
hi def link schemaName        fieldName

hi def link schemaField       Label
"hi def link fieldType         Type ?     an alternative
hi def link fieldType         Function
hi def link fieldIter         fieldType
hi def link fieldFreq         fieldIter

hi def link missingSemiCol    Error


let b:current_syntax = "fdb_schema"
