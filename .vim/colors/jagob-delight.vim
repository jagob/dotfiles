" ------------------------------------------------------------------
" Vim color file
" Name: moss (苔)
" Maintainer: Li Chunlin <yeiicn!gmail.com>
" Last Change: 2010-08-06
" Version: 2.1
" URL: http://vim.sourceforge.net/script.php?script_id=2779
" ------------------------------------------------------------------

" Init
" ------------------------------------------------------------------
set background=dark
highlight clear
if exists("syntax_on")
   syntax reset
endif
let g:colors_name = "jagob"

if &t_Co == 88 || &t_Co == 256

    " Highlighting groups for various occasions
    " ------------------------------------------------------------------
    
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

    hi Normal       ctermfg=7 
    hi Comment      ctermfg=8
    hi Cursor       ctermfg=none    ctermbg=7
    hi CursorIM     ctermfg=none    ctermbg=7
    hi CursorLine   cterm=none
    hi LineNr       ctermfg=8
    hi CursorLineNr ctermfg=8

    hi Constant     ctermfg=7
    hi String       ctermfg=7
    hi Character    ctermfg=7
    hi Number       ctermfg=12
    hi Boolean      ctermfg=12
    hi Float        ctermfg=12
    hi MatchParen   ctermfg=12
    hi NonText      ctermfg=12      "listchars eol,extends,precedes
    hi PreProc      ctermfg=12 
    hi Include      ctermfg=12
    hi Define       ctermfg=12
    hi Macro        ctermfg=12
    hi PreCondit    ctermfg=12

    hi Identifier   ctermfg=12
    hi Function     ctermfg=12
    hi Statement    ctermfg=12 " latex equations, return
    hi Conditional  ctermfg=12 " if
    hi Repeat       ctermfg=12
    hi Label        ctermfg=12
    hi Operator     ctermfg=12
    hi Keyword      ctermfg=12 " for
    hi Exception    ctermfg=12

    hi Type         ctermfg=10 " void, int
    hi StorageClass ctermfg=9
    hi Structure    ctermfg=12 " struct
    hi Typedef      ctermfg=9
    hi Special      ctermfg=7 " environment, equation constants
    hi Specialchar  ctermfg=10 " \\ %f \n
    hi Tag          ctermfg=9
    hi Delimiter    ctermfg=7 " {} $ &
    hi Debug        ctermfg=9
                    
    hi Underlined   ctermfg=12    cterm=underline
    hi Ignore       ctermfg=12
    hi Todo         ctermfg=12
    hi SpecialKey   ctermfg=12      " listchars tab trail nbsp
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
    hi FoldColumn   ctermfg=8   ctermbg=none
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
