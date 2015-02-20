" Init
" ------------------------------------------------------------------
set background=light
highlight clear
if exists("syntax_on")
   syntax reset
endif
let g:colors_name = "jagob-delight"

if &t_Co == 88 || &t_Co == 256

    " Highlighting groups for various occasions
    " ------------------------------------------------------------------
    
    " new Vim 7.0 items
    if v:version >= 700
       hi SignColumn   ctermfg=7    ctermbg=0
       hi TabLineFill  ctermfg=7    ctermbg=none
       hi TabLine      ctermfg=2    ctermbg=7
       hi TabLineSel   ctermfg=15   ctermbg=2
       hi Pmenu        ctermfg=7    ctermbg=0
       hi PmenuSel     ctermfg=7    ctermbg=241
       hi PmenuSbar    ctermfg=7    ctermbg=0
       hi PmenuThumb   ctermfg=7    ctermbg=0
       hi MatchParen   ctermfg=0    ctermbg=250
    endif

    hi Normal       ctermfg=0     ctermbg=15 

    hi Comment      ctermfg=10
    hi Cursor       ctermfg=none    ctermbg=7
    hi CursorIM     ctermfg=none    ctermbg=7
    hi CursorLine   cterm=none
    hi LineNr       ctermfg=8
    hi CursorLineNr ctermfg=8
    hi SignColumn   ctermbg=15

    hi Constant     ctermfg=2
    hi String       ctermfg=2
    hi Character    ctermfg=2
    hi Number       ctermfg=0
    hi Boolean      ctermfg=0
    hi Float        ctermfg=0
    hi MatchParen   ctermfg=0
    hi NonText      ctermfg=0      "listchars eol,extends,precedes
    hi PreProc      ctermfg=0 
    hi Include      ctermfg=0
    hi Define       ctermfg=0
    hi Macro        ctermfg=0
    hi PreCondit    ctermfg=0

    hi Identifier   ctermfg=0
    hi Function     ctermfg=0
    hi Statement    ctermfg=0 " latex equations, return
    hi Conditional  ctermfg=0 " if
    hi Repeat       ctermfg=0
    hi Label        ctermfg=0
    hi Operator     ctermfg=0
    hi Keyword      ctermfg=0 " for
    hi Exception    ctermfg=0

    hi Type         ctermfg=10 " void, int
    hi StorageClass ctermfg=9
    hi Structure    ctermfg=0 " struct
    hi Typedef      ctermfg=9
    hi Special      ctermfg=2 " environment, equation constants
    hi Specialchar  ctermfg=10 " \\ %f \n
    hi Tag          ctermfg=9
    hi Delimiter    ctermfg=2 " {} $ &
    hi Debug        ctermfg=9
                    
    hi Underlined   ctermfg=0    cterm=underline
    hi Ignore       ctermfg=0
    hi Todo         ctermfg=0
    hi SpecialKey   ctermfg=0      " listchars tab trail nbsp
    hi Directory    ctermfg=0
    hi MoreMsg      ctermfg=0
    hi ModeMsg      ctermfg=0
    hi WildMenu     ctermfg=0
    hi Question     ctermfg=0      ctermbg=none
    hi VertSplit    ctermfg=0      ctermbg=none
    hi Title        ctermfg=0

    hi Search       ctermfg=15      ctermbg=2
    hi IncSearch    ctermfg=2       ctermbg=15 " opposite
    hi Visual       ctermfg=15      ctermbg=2
    hi VisualNOS    ctermfg=15      ctermbg=2
    hi Folded       ctermfg=15      ctermbg=2
    hi FoldColumn   ctermfg=0       ctermbg=none
    hi StatusLine   ctermfg=0       ctermbg=0
    hi StatusLineNC ctermfg=0       ctermbg=0

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
    hi DiffAdd      ctermfg=none    ctermbg=193
    hi DiffDelete   ctermfg=9       ctermbg=209
    hi DiffChange   ctermbg=none    ctermbg=229
    hi DiffText     ctermfg=9       ctermbg=229



endif
