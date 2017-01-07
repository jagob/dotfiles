" Init
" ------------------------------------------------------------------
" From vimrc
" hilight word type under cursor
" map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"
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
    hi LineNr       ctermfg=10
    hi CursorLineNr ctermfg=10
    hi SignColumn   ctermbg=15

    hi Constant     ctermfg=4
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10
    hi String       ctermfg=3
    hi Character    ctermfg=5
    hi Number       ctermfg=4
    hi Boolean      ctermfg=4
    hi Float        ctermfg=4
    hi MatchParen   ctermfg=0
    hi NonText      ctermfg=0      "listchars eol,extends,precedes
    hi PreProc      ctermfg=9 
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.
    hi Include      ctermfg=9
    hi Define       ctermfg=0
    hi Macro        ctermfg=0
    hi PreCondit    ctermfg=0

    hi Identifier   ctermfg=0
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
    hi Function     ctermfg=2
    hi Statement    ctermfg=9 " latex equations, return
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw
    hi Conditional  ctermfg=2 " if
    hi Repeat       ctermfg=2 " for
    hi Operator     ctermfg=2 " in
    hi Label        ctermfg=1
    hi Keyword      ctermfg=4 
    hi Exception    ctermfg=9 

    hi Type         ctermfg=3 " void, int
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef
    hi StorageClass ctermfg=9
    hi Structure    ctermfg=9 " struct
    hi Typedef      ctermfg=9
    hi Special      ctermfg=5 " environment, equation constants
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements
    hi Specialchar  ctermfg=5 " \\ %f \n
    hi Tag          ctermfg=9
    hi Delimiter    ctermfg=2 " {} $ &
    hi Debug        ctermfg=9
                    
    hi Underlined   ctermfg=0    cterm=underline
    hi Ignore       ctermfg=0
    hi Todo         ctermfg=7   ctermbg=9
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
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

    hi Error        ctermfg=1       ctermbg=none        
    hi ErrorMsg     ctermfg=1       ctermbg=none
    hi WarningMsg   ctermfg=1       ctermbg=none
    hi SpellBad     ctermfg=1       ctermbg=none
    hi SpellCap     ctermfg=1       ctermbg=none
    hi SpellLocal   ctermfg=1       ctermbg=none
    hi SpellRare    ctermfg=1       ctermbg=none

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
