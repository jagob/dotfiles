set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="jagob"
" hey
hi Normal guifg=#ffffff guibg=#000000
hi Comment ctermfg=8 guibg=NONE
hi Constant guifg=#0dff00 guibg=NONE
hi String guifg=#ffc800 guibg=NONE
hi htmlTagName guifg=#55ff00 guibg=NONE
hi Identifier guifg=#40ffff guibg=NONE
hi Statement guifg=#1aff00 guibg=NONE
hi PreProc guifg=#ffc800 guibg=NONE
hi Type guifg=#0073ff guibg=NONE
hi Function guifg=#ffaa00 guibg=NONE
hi Repeat guifg=#ff006a guibg=NONE
hi Operator guifg=#ff0000 guibg=NONE
hi Error ctermfg=9 guifg=#ffffff cterm=underline
hi TODO guibg=#0011ff guifg=#ffffff

hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
