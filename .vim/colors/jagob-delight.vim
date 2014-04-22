set background=dark
highlight clear
if exists("syntax_on")
   syntax reset
endif
let g:colors_name = "jagob-delight"

if &t_Co == 88 || &t_Co == 256

    " Highlighting groups for various occasions
    " ---------------------------------------------------------------
    " new Vim 7.0 items
    if v:version >= 700
       hi SignColumn   ctermfg=7 ctermbg=0
       hi TabLine      ctermfg=8 ctermbg=0
       hi TabLineSel   ctermfg=7 ctermbg=0
       hi TabLineFill  ctermfg=0 ctermbg=241
       hi Pmenu        ctermfg=7 ctermbg=0
       hi PmenuSel     ctermfg=7 ctermbg=241
       hi PmenuSbar    ctermfg=7 ctermbg=0
       hi PmenuThumb   ctermfg=7 ctermbg=0
       hi MatchParen   ctermfg=0 ctermbg=250
    endif

    hi Normal       ctermfg=235    ctermbg=230
    hi Comment      ctermfg=94
    hi Cursor       ctermfg=235    ctermbg=235
    hi CursorIM     ctermfg=235    ctermbg=235
    hi CursorLine   ctermfg=235    ctermbg=253
    hi LineNr       ctermfg=235
    hi CursorLineNr ctermfg=235    ctermbg=235

    hi Constant     ctermfg=64 " 124
    hi String       ctermfg=64
    hi Character    ctermfg=64
    hi Number       ctermfg=64
    hi Boolean      ctermfg=64
    hi Float        ctermfg=64
    hi NonText      ctermfg=64   "listchars eol,extends,precedes
    hi PreProc      ctermfg=64
    hi Include      ctermfg=64
    hi Define       ctermfg=64
    hi Macro        ctermfg=64
    hi PreCondit    ctermfg=64

    hi Operator     ctermfg=235 " =
    hi Identifier   ctermfg=130
    hi Function     ctermfg=130
    hi Statement    ctermfg=130 " latex equations, return
    hi Conditional  ctermfg=130 " if
    hi Repeat       ctermfg=130
    hi Label        ctermfg=130
    hi Keyword      ctermfg=130 " for
    hi Exception    ctermfg=130

    hi Type         ctermfg=130 " void, int
    hi cType        ctermfg=130 " int float char
    hi StorageClass ctermfg=130 
    hi Structure    ctermfg=130 " struct
    hi Typedef      ctermfg=130 
    hi Special      ctermfg=130 " environment, equation constants
    hi Specialchar  ctermfg=130 " \\ %f \n
    hi Tag          ctermfg=130 
    hi Delimiter    ctermfg=130 " {} $ &
    hi Debug        ctermfg=130 
                    
    hi Underlined   ctermfg=12    cterm=underline
    hi Ignore       ctermfg=12
    hi Todo         ctermfg=12
    hi SpecialKey   ctermfg=12  " listchars tab trail nbsp
    hi Directory    ctermfg=12
    hi MoreMsg      ctermfg=12
    hi ModeMsg      ctermfg=12
    hi WildMenu     ctermfg=12
    hi Question     ctermfg=12  ctermbg=none
    hi VertSplit    ctermfg=12   ctermbg=none
    hi Title        ctermfg=12

    hi Search       ctermfg=232   ctermbg=8 
    hi IncSearch    ctermfg=8   ctermbg=232 " opposite
    hi Visual       ctermfg=232   ctermbg=8
    hi VisualNOS    ctermfg=232   ctermbg=8
    hi Folded       ctermfg=8   ctermbg=0
    hi FoldColumn   ctermfg=232   ctermbg=none
    hi StatusLine   ctermfg=7   ctermbg=0
    hi StatusLineNC ctermfg=7   ctermbg=0

    hi Error        ctermfg=9       ctermbg=none        
    hi ErrorMsg     ctermfg=9       ctermbg=none
    hi WarningMsg   ctermfg=9       ctermbg=none
    hi SpellBad     ctermfg=9       ctermbg=none
    hi SpellCap     ctermfg=9       ctermbg=none
    hi SpellLocal   ctermfg=9       ctermbg=none
    hi SpellRare    ctermfg=9       ctermbg=none

" LanguageTool
     hi LanguageToolGrammarError    ctermfg=9 ctermbg=none
     hi LanguageToolSpellingError   ctermfg=9 ctermbg=none
     hi LanguageToolCmd             ctermfg=9 ctermbg=none
     hi LanguageToolLabel           ctermfg=9 ctermbg=none
     hi LanguageToolErrorCount      ctermfg=9 ctermbg=none

" vimdiff
    hi DiffAdd      ctermfg=12  ctermbg=none
    hi DiffDelete   ctermfg=9   ctermbg=none
    hi DiffChange   ctermbg=255 ctermbg=0
    hi DiffText     ctermfg=3   ctermbg=none

endif
