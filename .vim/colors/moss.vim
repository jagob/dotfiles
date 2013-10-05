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
let g:colors_name = "moss"

if has("gui_running")
    " Highlighting groups for various occasions
    " ------------------------------------------------------------------
    hi SpecialKey   guifg=RosyBrown4
    hi NonText      guifg=MidnightBlue guibg=#0C2628
    hi Directory    gui=BOLD guifg=DarkOliveGreen3
    hi ErrorMsg     guifg=LightGoldenRod guibg=Firebrick
    hi IncSearch    gui=BOLD guifg=Firebrick1
    hi Search       gui=REVERSE guifg=NONE guibg=NONE
    hi MoreMsg      guifg=DarkCyan
    hi ModeMsg      guifg=OliveDrab2
    hi LineNr       guifg=DarkSeaGreen3 guibg=#0C2628
    hi Question     guifg=Green
    hi StatusLine   gui=BOLD guifg=LemonChiffon3 guibg=#334680
    hi StatusLineNC gui=BOLD guifg=Honeydew4 guibg=Gray26
    hi VertSplit    gui=BOLD guifg=Gray20 guibg=Gray26
    hi Title        gui=BOLD guifg=RoyalBlue3
    hi Visual       guifg=PowderBlue guibg=#22364C
    hi VisualNOS    gui=BOLD,UNDERLINE guifg=SlateGray
    hi WarningMsg   guifg=Gold
    hi WildMenu     gui=BOLD guifg=Black guibg=Chartreuse3
    hi Folded       guifg=PaleGreen3 guibg=DarkSlateGray
    hi FoldColumn   gui=BOLD guifg=PaleGreen3 guibg=DarkSlateGray
    hi DiffAdd      guifg=SandyBrown guibg=DarkOliveGreen
    hi DiffChange   guibg=#3C444C
    hi DiffDelete   guifg=Gray20 guibg=Black
    hi DiffText     guifg=Chocolate guibg=#033B40

    " new Vim 7.0 items
    if v:version >= 700
       hi CursorColumn guibg=#063C36
       hi CursorLine   guibg=#063C36
       hi SignColumn   guifg=PaleGoldenrod guibg=Turquoise4
       hi TabLine      guifg=CornflowerBlue guibg=Gray26
       hi TabLineSel   guifg=RoyalBlue guibg=#082926
       hi TabLineFill  gui=UNDERLINE guifg=CornflowerBlue guibg=Gray20
       hi Pmenu        guifg=White guibg=MediumPurple4
       hi PmenuSel     guifg=Wheat guibg=#22364C
       hi PmenuSbar    guifg=Tan   guibg=SeaShell4
       hi PmenuThumb   guifg=IndianRed   guibg=SeaShell4
       hi MatchParen   gui=BOLD guifg=GoldenRod guibg=DarkCyan
    endif

    hi Cursor       guifg=Black guibg=LimeGreen
    hi CursorIM     guifg=Black guibg=OrangeRed

    " Syntax highlighting groups
    " ------------------------------------------------------------------

    hi Normal      gui=NONE guifg=LightBlue3 guibg=#082926
    hi Comment     gui=ITALIC guifg=BurlyWood4

    hi Constant    gui=NONE guifg=CadetBlue3
    hi link        String    Constant
    hi link        Character Constant
    hi Number      gui=NONE guifg=Turquoise3
    hi link        Boolean Number
    hi link        Float   Number

    hi Identifier  gui=NONE guifg=SteelBlue3
    hi Function    gui=NONE guifg=Aquamarine3

    hi Statement   gui=NONE guifg=SpringGreen3
    hi link        Conditional Statement
    hi link        Repeat      Statement
    hi link        Label       Statement
    hi Operator    gui=NONE guifg=SeaGreen3
    hi link        Keyword     Statement
    hi link        Exception   Statement

    hi PreProc     gui=NONE guifg=DodgerBlue3
    hi link        Include   PreProc
    hi link        Define    PreProc
    hi link        Macro     PreProc
    hi link        PreCondit PreProc

    hi Type        gui=NONE guifg=DeepSkyBlue3
    hi link        StorageClass Type
    hi link        Structure    Type
    hi link        Typedef      Type

    hi Special     gui=NONE guifg=SlateBlue
    hi link        Specialchar Special
    hi link        Tag         Special
    hi link        Delimiter   Special
    hi link        Debug       Special

    hi Underlined  gui=UNDERLINE guifg=SkyBlue3
    hi Ignore      gui=NONE guifg=Gray18
    hi Error       gui=NONE guifg=Khaki3 guibg=VioletRed4
    hi Todo        gui=BOLD guifg=GoldenRod3 guibg=NONE

elseif &t_Co == 88 || &t_Co == 256

    " Highlighting groups for various occasions
    " ------------------------------------------------------------------
    
    " new Vim 7.0 items
    if v:version >= 700
       hi SignColumn   ctermfg=229 ctermbg=30
       hi TabLine      ctermfg=69  ctermbg=238
       hi TabLineSel   ctermfg=69
       hi TabLineFill  ctermfg=69  ctermbg=236
       hi Pmenu        ctermfg=231 ctermbg=97
       hi PmenuSel     ctermfg=223 ctermbg=60
       hi PmenuSbar    ctermfg=180 ctermbg=245
       hi PmenuThumb   ctermfg=167 ctermbg=245
       hi MatchParen   ctermfg=172 ctermbg=30
    endif

    hi Normal       ctermfg=101 
    hi Comment      ctermfg=241
    hi Cursor       ctermfg=none    ctermbg=47
    hi CursorIM     ctermfg=none    ctermbg=47
    hi CursorLine   cterm=none
    hi LineNr       ctermfg=151
    hi CursorLineNr ctermfg=41

    hi Constant     ctermfg=227 " 38
    hi String       ctermfg=227
    hi Character    ctermfg=227
    hi Number       ctermfg=227
    hi Boolean      ctermfg=227
    hi Float        ctermfg=227
    hi MatchParen   ctermfg=227
    hi NonText      ctermfg=227
    hi PreProc      ctermfg=227 
    hi Include      ctermfg=227
    hi Define       ctermfg=227
    hi Macro        ctermfg=227
    hi PreCondit    ctermfg=227

    hi Identifier   ctermfg=41 " 41 35
    hi Function     ctermfg=41
    hi Statement    ctermfg=41
    hi Conditional  ctermfg=41
    hi Repeat       ctermfg=41
    hi Label        ctermfg=41
    hi Operator     ctermfg=41
    hi Keyword      ctermfg=41
    hi Exception    ctermfg=41

    hi Type         ctermfg=151
    hi StorageClass ctermfg=151
    hi Structure    ctermfg=151
    hi Typedef      ctermfg=151
    hi Special      ctermfg=151
    hi Specialchar  ctermfg=151
    hi Tag          ctermfg=151
    hi Delimiter    ctermfg=151
    hi Debug        ctermfg=151
                    
    hi Underlined   ctermfg=203    cterm=underline
    hi Ignore       ctermfg=47
    hi Todo         ctermfg=47
    hi SpecialKey   ctermfg=47
    hi Directory    ctermfg=47
    hi MoreMsg      ctermfg=47
    hi ModeMsg      ctermfg=47 "-insert
    hi WildMenu     ctermfg=151
    hi Question     ctermfg=203
    hi VertSplit    ctermfg=236   ctermbg=238
    hi Title        ctermfg=68

    hi Search       ctermfg=203	ctermbg=237
    hi IncSearch    ctermfg=203
    hi Visual       ctermfg=151   ctermbg=237
    hi VisualNOS    ctermfg=60
    hi Folded       ctermfg=151   ctermbg=237
    hi FoldColumn   ctermfg=151   ctermbg=none
    hi StatusLine   ctermfg=41   ctermbg=60
    hi StatusLineNC ctermfg=41   ctermbg=238

    hi Error        ctermfg=203
    hi ErrorMsg     ctermfg=203
    hi WarningMsg   ctermfg=203
    hi SpellBad     ctermfg=203 ctermbg=none
    hi SpellCap     ctermfg=203 ctermbg=none
    hi SpellLocal   ctermfg=203 ctermbg=none
    hi SpellRare    ctermfg=203 ctermbg=none

    hi DiffAdd      ctermfg=215   ctermbg=107
    hi DiffChange   ctermbg=60
    hi DiffDelete   ctermfg=236   ctermbg=16
    hi DiffText     ctermfg=166   ctermbg=23

endif
