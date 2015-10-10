" github.com/jagob
filetype off

execute pathogen#infect()

filetype on
filetype indent on
filetype plugin on
syntax on

set nocompatible                "no vi emulation
let mapleader = ","
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set gcr=a:blinkon0              " Disable cursor blink
set mouse=a                     " Enable mouse
set visualbell                  " No sounds
set t_vb=                       " No blink at first/last line
set autoread                    " Reload files changed outside vim

" timeoutlen defaults to 1000 and is the delay in milliseconds that vim uses when checking for map key sequences. It’s also used when checking keycodes if ttimeoutlen is disabled
" set timeoutlen =1000
set ttimeoutlen=0

au BufRead /tmp/mutt-* set tw=72 " textwrap for mutt
" set textwidth=80 " set textwidth to 80 to cause wrapping
" set nowrap          " set wrap
set wrap
set linebreak       " wrap at 'breakat' instead of last char
set history=1000    " command lines history
set nojoinspaces    " only put one space after periods

set hlsearch        " hilight all words
set incsearch       " seach as you type
set ignorecase      " Autocompletion try all words regardless of case
set smartcase       " if capital letters become case sensitive
set showmatch       " show matching parenthesis

set foldenable
set foldmethod=syntax   " syntax,manual,indent
set foldcolumn=2
" set foldlevel=1
" set foldclose=all

" to keep fold history
" au BufWinLeave * silent! mkview	" save buffer view on exit
" au BufWinEnter * silent! loadview " restore buffer view on enter

" Turn off Swap Files
set noswapfile
set nobackup
set nowb

" Scrolling
set scrolloff=7         "Start scrolling when we're 7 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Statusline
"highlight StatusLine ctermfg=blue ctermbg=yellow " Highlight the status line
set laststatus=2 " for powerline

" Soeren tabs
set tabstop=4       " tab width
set shiftwidth=4    " indention
set softtabstop=4   " backspace deletes indents
set expandtab       " use spaces
set autoindent      " autoindent

" listchar tab wont work with expandtab
" set list
" set encoding=utf-8
" set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" exec "set list lcs=tab:»~,trail:¬,nbsp:▸"

" Colors
" let g:solarized_termcolors=256
" set t_Co=256 "set t_Co=16
set background=light
" colorscheme solarized
colorscheme jagob-delight

" mark line 80
"set colorcolumn=80
"highlight ColorColumn ctermbg=233

" set comments-=s1:/*,mb:*,ex:*/" "Don't recognize C comments
" set comments=sl:/*,mb:\ *,elx:\ */

" ----------------------------------------------------------------------------
" Spell checking
syn spell toplevel

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s  " next mistake
map <leader>sp [s  " previous mistake
map <leader>sa zg  " add to dictionary
map <leader>s? z=  " lookup word

autocmd FileType tex setlocal spell spelllang=en_gb,da
autocmd FileType mail set spell

" where it should get the dictionary files
" let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" ret hvis du staver forkert
:iabbrev teh the

set wildmenu
set wildmode=longest,list " like bash
"Wildmenu aoutcompletion like zsh 
"set wildmode = full
set wildignore=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.dvi,*.fff,*.log,*.out,*.pdf,*.ps,*.toc,*.ttt 


" Latex------------------------------------------------------------
" Syntax enable
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set shellslash

" Run latex, then dvipdf, then refresh the xpdf window.
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_CompileRule_pdf = 'dvipdf $*.dvi; xpdf -remote 127.0.0.1 -reload -raise'
"let g:Tex_ViewRule_pdf = 'xpdf -remote 127.0.0.1'
let g:Tex_DefaultTargetFormat = 'pdf'	" Set the target format to pdf.
" latex:
let g:Tex_CompileRule_dvi = 'pdflatex -interaction=nonstopmode -file-line-error-style $*' "ikke helt lovligt heh
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_MultipleCompileFormats='pdf, aux'

" spellcheck comments
let g:tex_comment_nospell=0

" Set the warning messages to ignore.
let g:Tex_IgnoredWarnings =
\"Underfull\n".
\"Overfull\n".
\"specifier changed to\n".
\"You have requested\n".
\"Missing number, treated as zero.\n".
\"There were undefined references\n".
\"Citation %.%# undefined\n".
\'LaTeX Font Warning:'"
" \"Package pgfkeys Error: I do not\n".
" This number N says that latex-suite should ignore the first N of the above.
let g:Tex_IgnoreLevel = 8
let g:Tex_GotoError=0

" When at \ref{fig:}, press Ctrl-N to cycle through your labels
" \label{fig:something}
autocmd BufRead,BufNewFile *.tex set iskeyword+=:-_

nnoremap <leader>ls :silent call Tex_RunLaTeX()<cr>
let g:Tex_UseMakefile=1
"   Compile LaTeX for the current file only
function! LatexCurrent()
    let a:localLatexCommand = 'echo '
    let a:localLatexCommand .= '\\input{set/preamble}'
    let a:localLatexCommand .= '\\input{set/macros}'
    let a:localLatexCommand .= '\\input{set/listings}'
    let a:localLatexCommand .= '\\\\begin{document}'
    let a:localLatexCommand .= '\\pagenumbering{arabic}\\input{'
    let a:curfile = expand('%:p')
    let a:localLatexCommand .= a:curfile
    let a:localLatexCommand .= '}\\\\end{document}'
    let a:localLatexCommand .= '> /home/jacob/documents/vgis8/article/masterlocal.tex'
    echom system(a:localLatexCommand)
    execute "!cd /home/jacob/documents/vgis8/article/ && pdflatex -shell-escape masterlocal.tex"
endf
autocmd FileType tex map <leader>lo :call LatexCurrent() <cr> <cr>
autocmd FileType tex map <leader>lp :! zathura masterlocal.pdf & <cr> <cr>

" grammar languagetool
let g:languagetool_jar='/home/jacob/.vim/bundle/languagetool/LanguageTool-2.5-SNAPSHOT/languagetool-commandline.jar'
let g:languagetool_winheight=16
let g:languagetool_disable_rules="MORFOLOGIK_RULE_EN_GB,WHITESPACE_RULE,COMMA_PARENTHESIS_WHITESPACE"
" let g:languagetool_disable_rules="EN_QUOTES,WHITESPACE_RULE,EN_UNPAIRED_BRACKETS,ARTICLE_MISSING,COMMA_PARENTHESIS_WHITESPACE,UPPERCASE_SENTENCE_START,WORD_REPEAT_RULE,DOUBLE_PUNCTUATION,EN_A_VS_AN,THREE_NN,PHRASE_REPETITION,THIS_NNS,MORFOLOGIK_RULE_EN_GB"
map :g :LanguageToolCheck<CR>


" Mappings -------------------------------------------------------------------
map :Q :q<CR>
map <C-q> :q<CR>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

"open new terminal
nnoremap <buffer> <F3> :exec '!urxvt &' shellescape(@%, 1)<cr>"

noremap <F4> :silent noh<CR>
map     <F6>      :set list!<CR>:set list?<CR>
imap    <F6> <C-O>:set list!<CR><C-O>:set list?<CR>

" map cut & paste to what they bloody should be
vnoremap <C-c> "+y " copy
map <C-v> "+gP     " paste
imap <C-v> <Esc>"+gP" paste
vnoremap <C-x> "+x " cut
" clipboard=unnamed
" clipboard^=unnamed " for arch linux, see :h clipboard-exclude 
set pastetoggle=<F2>

" Remap line motion Practical vim page 111
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Smart way to move between windows
" let g:BASH_Ctrl_j = 'off' " to map j
nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward "latexsuite wont override j map
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tabs
" map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
" map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <C-t> <esc>:tabnew<cr>
map <C-n> <esc>:tabnext<cr>
map <C-p> <esc>:tabprevious<cr>
map <C-m> <esc>:tabmove +1 <cr>
" map <Leader>tc :tabnew %<cr> " create a new tab
" map <Leader>tt :tabnew %<cr> " create a new tab
" map <Leader>td :tabclose<cr> " close a tab
" map <Leader>tn :tabnext<cr> " next tab
" map <Leader>tp :tabprev<cr>" previous tab
" map <Leader>tm :tabmove " move a tab to a new location

" Buffer taken from Practical Vim page 78
nnoremap <leader>p :bprevious<CR>
" nnoremap <leader>n :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> [B :bfirst<CR>
" nnoremap <silent> ]B :blast<CR>

" Only use Block Visual mode
nnoremap v      <C-V>
vnoremap v      <C-V>
" nnoremap <C-V>  v
" vnoremap <C-V>  v

" Stay in visual mode when indenting with < >
vnoremap > >gv
vnoremap < <gv

" save read-only files
cmap w!! %!sudo tee > /dev/null %

" word count
" g C-G

" nnoremap <leader>win :%s/M]//g
nnoremap <leader>win :%s/
nnoremap <leader>cc :!gcc % -o %<
" nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>"
" nnoremap <buffer> <F9> :!python % <cr>"
autocmd BufRead *.py nmap <F5> :!python2 %<CR>
"map <F9> : !gcc % && ./a.out <CR>
nnoremap <F5> :make!<cr>

" Plugins ----------------------------------------------------------
"
" FuzzyFinder
map <C-o> :FufCoverageFile<CR> 
let g:fuf_coveragefile_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.class$'

" NERDTree "autocmd vimenter * NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" TComment
" see .vim/plugin/autoload/tcomment.vim to change comment style
" map <leader>c <c-_><c-_>
map <leader>c :TComment<cr>

" Smooth scrolling
" 3 parameters: distance, duration[ms], #lines
noremap <silent> <c-u> :call smooth_scroll#up	(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down	(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up	(&scroll, 10, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down	(&scroll, 10, 1)<CR>

" ctags ----------------------------------------------------------
" use ctrl+] to jump to definition, in a new tab
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Generate a .tags file, which vim can use to scan for keywords
map <f12> :!ctags -R .<cr> 
" Taglist --------------------------------------------------------
map <leader>tl :TlistToggle <cr>
let Tlist_WinWidth = 30
let Tlist_File_Fold_Auto_Close = 1
" use space to see arguments
" :help taglist

" Rainbow Parentheses
" Left column is for terminal environment
" Right column is for GUI environment
let g:rbpt_colorpairs = [
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ]
    " \ ['darkcyan',    'SeaGreen3'],
    " \ ['darkred',     'DarkOrchid3'],
    " \ ['red',         'firebrick3'],
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound     " ()
au Syntax * RainbowParenthesesLoadSquare    " []
au Syntax * RainbowParenthesesLoadBraces    " {}
" au Syntax * RainbowParenthesesLoadChevrons " <> 

" dragvisuals.vim
vmap <expr> <LEFT>  DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN>  DVB_Drag('down')
vmap <expr> <UP>    DVB_Drag('up')
vmap <expr> D       DVB_Duplicate()

" vmath.vim sum average min max
" Fix this
vmap <expr> ++ VMATH_YankAndAnalyse()
vmap <C-æ> VMATH_YankAndAnalyse()
nmap        ++ vip++

" config for easytags
" let g:easytags_file = '~/.vtags'

" mru - most recently used
let MRU_Window_Height = 15 
let MRU_Max_Entries = 15
let MRU_Auto_Close = 1
map :mru :MRU <CR>
" map <C-m> :MRU <CR>
nnoremap <Leader>mru :MRU<CR>
" nmap :MRU :mru <CR>
" let MRU_Include_Files = '^/Users/ok/Dropbox/StageM2/report/.*'
" let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

" hilight word type under cursor
map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" vis.vim
" When block is selected
":B apply to block only

" Tasklist
map T :TaskList<CR>
" map P :TlistToggle<CR>"

" SUPERTAB
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview

" OmniCppComplete -----------------------------------------------------------
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set omnifunc=syntaxcomplete#Complete
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
" autocmd filetype python set omnifunc=pythoncomplete#complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Syntastic --------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_python_checkers = ['flake8']  " flake8, pyflakes, pylint, python
let g:syntastic_quiet_messages = { "type": "style" }    " Disable style messages
let g:syntastic_python_flake8_args = '--ignore="E901"'
" let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801,E303,E211,E901"'
" map <silent> <Leader>e :Errors<CR>
" map <Leader>s :SyntasticToggleMode<CR>
