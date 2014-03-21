" github.com/jagob
filetype off

" Pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" cd ~/.vim/autoload
" git clone https://github.com/tpope/vim-pathogen/
execute pathogen#infect()

filetype on
filetype indent on
filetype plugin on 
syntax on		" Switch on syntax highlighting.

set nocompatible "no vi emulation
let mapleader = ","
set pastetoggle=<F2>

" set comments=sl:/*,mb:\ *,elx:\ */

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set gcr=a:blinkon0              "Disable cursor blink
set mouse=a
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" timeoutlen defaults to 1000 and is the delay in milliseconds that vim uses when checking for map key sequences. It’s also used when checking keycodes if ttimeoutlen is disabled
" Adjust keycode timeout length
set ttimeoutlen=100


au BufRead /tmp/mutt-* set tw=72 " textwrap for mutt
" set textwidth=80 " set textwidth to 80 to cause wrapping
set wrap
set linebreak	" wrap at 'breakat' instead of last char
set history=100 " command lines history
set nojoinspaces " only put one space after periods
" set noesckeys " Get rid of the delay when hitting esc!

set hlsearch " hightlight search
set incsearch " seach as you tyoe
set ignorecase "Autocompletion try all words regardless of case
set smartcase " if capital letters become case sensitive
set showmatch     " set show matching parenthesis

set foldenable
" set foldmethod=manual
set foldmethod=syntax
" set foldmethod=indent
:set foldcolumn=2
" set foldlevel=1
" set foldclose=all

" to keep fold history
" au BufWinLeave * silent! mkview	" save buffer view on exit
" au BufWinEnter * silent! loadview " restore buffer view on enter

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Scrolling
set scrolloff=7         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Statusline
"highlight StatusLine ctermfg=blue ctermbg=yellow " Highlight the status line
set laststatus=2 " for powerline

" Soeren tabs
set tabstop=4                     " tab width
set shiftwidth=4                  " indention
set softtabstop=4                 " backspace deletes indents
set expandtab                     " use spaces
set autoindent                    " autoindent


" set autoindent    " indent same as last line
" set smartindent " good for coding
" set noexpandtab
" :set tabstop=3
" set softtabstop=4 "specifies how many columns Vim uses when Tab Tab is hit in Insert mode
" set smarttab      " insert tabs on the start of a line according to shiftwidth, not ta
" set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" set copyindent    " copy the previous indentation on autoindenting
" set shiftwidth=3  " number of spaces to use for autoindenting

" set autoindent "New lines are indented the same as thep revious line
" set smartindent
" set cindent "indents your program according to a “standard” C style

" Tabs
" http://www.jwz.org/doc/tabs-vs-spaces.html
" set expandtab " Use spaces instead of tabs
" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'. 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
" set noexpandtab "powerline
" set smarttab
" 1 tab == 3 spaces
" set shiftwidth=3 " controls how many spaces are inserted when using the >> >> / << <<
" set tabstop=4
" :retab

" set tabstop=4 "(the default), 
" set softtabstop=4 "specifies how many columns Vim uses when Tab Tab is hit in Insert mode
" set shiftwidth=4
" set noexpandtab
" 
" :set tabstop=8
" :set shiftwidth=4
" :set expandtab

" Colors
set t_Co=256 "set t_Co=16
set background=dark
colorscheme jagob

" mark line 80
"set colorcolumn=80
"highlight ColorColumn ctermbg=233

" ----------------------------------------------------------------------------
" Spell checking
"When editing files their current encoding is maintained, so if you opened a file in ISO-8859-2 , your changes would be written in that encoding. To force UTF-8 for all files use 
":set encoding=utf-8 fileencodings= 

" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf8

" Use Unix as the standard file type
"set ffs=unix,dos,mac
"
syn spell toplevel

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s  " next mistake
map <leader>sp [s  " previous mistake
map <leader>sa zg  " add to dictionary
map <leader>s? z=  " lookup word

"au BufRead *.tex setlocal spell
autocmd FileType tex setlocal spell spelllang=en_gb
"autocmd FileType tex setlocal spell spelllang=en,dk

" where it should get the dictionary files
"let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" ret hvis du staver forkert
:iabbrev teh the

"Wildmenu tab completion
set wildmode=longest,list " like bash
"Wildmenu aoutcompletion like zsh 
set wildmenu
"set wildmode = full
set wildignore=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.dvi,*.fff,*.log,*.out,*.pdf,*.ps,*.toc,*.ttt 


" latex -----------------------------------------------------------------------
"  latex
" :Tabularize /&
" :'<,'>Tabularize /&

"syntax enable
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

" spellcheck ikke i kommentarer
let g:tex_comment_nospell=1 "latex

let g:Tex_UseMakefile=1

let g:Tex_GotoError=0

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

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig:} and press Ctrl-N you will automatically cycle through
" all the figure labels. Very useful!
autocmd BufRead,BufNewFile *.tex set iskeyword+=:,-
" set iskeyword+=:-,

" If you want to automatically compile and refresh xdvi whenever you write the current buffer, you can add the following code into your tex.vim ftplugin
" au BufWritePost *.tex silent call Tex_RunLaTeX()
" au BufWritePost *.tex silent !pkill -USR1 xdvi.bin
"
" grammar languagetool
" let g:languagetool_jar='/home/jacob/downloads/languagetool/languagetool-standalone/target/LanguageTool-2.4-SNAPSHOT/LanguageTool-2.4-SNAPSHOT/languagetool-commandline.jar'
let g:languagetool_jar='/home/jacob/.vim/bundle/languagetool/target/LanguageTool-2.5-SNAPSHOT/LanguageTool-2.5-SNAPSHOT/languagetool-commandline.jar'
let g:languagetool_winheight=16
let g:languagetool_disable_rules="MORFOLOGIK_RULE_EN_GB,WHITESPACE_RULE,COMMA_PARENTHESIS_WHITESPACE"
" let g:languagetool_disable_rules="EN_QUOTES,WHITESPACE_RULE,EN_UNPAIRED_BRACKETS,ARTICLE_MISSING,COMMA_PARENTHESIS_WHITESPACE,UPPERCASE_SENTENCE_START,WORD_REPEAT_RULE,DOUBLE_PUNCTUATION,EN_A_VS_AN,THREE_NN,PHRASE_REPETITION,THIS_NNS,MORFOLOGIK_RULE_EN_GB"
map :g :LanguageToolCheck<CR>

"   Compile LaTeX for the current file only
function! LatexCurrent()
    let a:localLatexCommand = 'echo '
    let a:localLatexCommand .= '\\input{set/preamble}'
    let a:localLatexCommand .= '\\input{set/listings}'
    let a:localLatexCommand .= '\\input{set/macros}'
    let a:localLatexCommand .= '\\begin{document}'
    let a:localLatexCommand .= '\\pagenumbering{arabic}\\input{'
    let a:curfile = expand('%:p')
    let a:localLatexCommand .= a:curfile
    let a:localLatexCommand .= '}\\end{document}'
    let a:localLatexCommand .= '> /home/jacob/documents/svn/p6/rep/masterlocal.tex'
    echom system(a:localLatexCommand)
    execute "!cd /home/jacob/documents/svn/p6/rep/ && pdflatex masterlocal.tex"
endf
autocmd FileType tex map <leader>lo :call LatexCurrent() <cr> <cr>
autocmd FileType tex map <leader>lp :! zathura masterlocal.pdf & <cr> <cr>

" ----------------------------------------------------------------------------
" MATLAB
" integration of mlint code checker with :make command
" autocmd BufEnter *.m  compiler mlint
" use F5 to run .m file
" au FileType matlab map <buffer> <silent> <F5> :w<CR>:!matlab -nodesktop -nosplash -r "try, run(which('%')), pause, end, quit" <CR>\\|<ESC><ESC>
" .m file folding
" au FileType matlab set foldmethod=syntax foldcolumn=2 foldlevel=33
" 
" map <leader>r :w<CR>:!/usr/local/MATLAB/R2013a/bin/matlab -nodesktop -nosplash -r "try, run %:p, pause, catch, end, quit" <CR> <CR>

" matlab 2
" prefences -> editor ->
" /usr/bin/urxvt -e /usr/bin/mutt

" Mappings -------------------------------------------------------------------
map :Q :q<CR>
map <C-q> :q<CR>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

"open new terminal
map  <F3> :! urxvt &<CR>
nmap <F3> :! urxvt &<CR>
imap <F3> :! urxvt &<CR>

" map cut & paste to what they bloody should be
vnoremap <C-c> "+y " copy
map <S-b> "+gP     " paste
vnoremap <C-x> "+x " cut
" clipboard=unnamed
" clipboard^=unnamed " for arch linux, see :h clipboard-exclude 

" save read-only files
cmap w!! %!sudo tee > /dev/null %

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

map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <C-t> <esc>:tabnew<CR>
"map <C-w> <esc>:tabclose<cr>
map <C-n> <esc>:tabnext<cr>
map <C-p> <esc>:tabprevious<cr>

" tabs
map <Leader>tc :tabnew %<cr> " create a new tab
map <Leader>td :tabclose<cr> " close a tab
map <Leader>tn :tabnext<cr> " next tab
map <silent><m-Right> :tabnext<cr> " next tab
map <Leader>tp :tabprev<cr>" previous tab
map <silent><m-Left> :tabprev<cr> " previous tab
map <Leader>tm :tabmove " move a tab to a new location

" Buffer taken from Practical Vim page 78
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv

nnoremap <leader>cc :!gcc % -o %<
nnoremap <leader>win :%s/M]//g
" Plugins ---------------------------------------------------------------------
" NERDTree
" git clone https://github.com/scrooloose/nerdtree
"autocmd vimenter * NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" ========== C.vim ==================
" git clone https://github.com/vim-scripts/c.vim


" ========== snipmate.vim ==================
" vnoremap <C-x> "+x " cut
" git clone https://github.com/msanders/snipmate.vim

" ---------------------------------------------------------------------------
" config for easytags
let g:easytags_file = '~/.vtags'
" tag-related keybinds:
" open tag in new tab
map <c-\> :tab split<cr>:exec("tag ".expand("<cword>"))<cr>
" open tag in split with ,\
map <localleader>\ :split <cr>:exec("tag ".expand("<cword>"))<cr>
" open tag in vsplit with ,]
map <localleader>] :vsplit <cr>:exec("tag ".expand("<cword>"))<cr>

" TComment
map <leader>c <c-_><c-_>

" ctags  ================
map <f12> :!ctags -R .<cr> 
" generate a .tags file, which vim can use to scan for keywords
" use ctrl+] to jump to definition
" C-T - Jump back from the definition
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" C-\ - Open the definition in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" A-] - Open the definition in a vertical split

" thesaurus synonym ordbog ======================
"C-x C-t

" SUPERTAB
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview

" FuzzyFinder
map <C-o> :FufCoverageFile<CR> 

" Rainbow Parentheses
" Left column is for terminal environment.
" Right column is for GUI environment."
let g:rbpt_colorpairs = [
    \ ['yellow'		,	'DarkOrchid3'],
    \ ['lightyellow'	,	'DarkOrchid3'],
    \ ] 	 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" au Syntax * RainbowParenthesesLoadChevrons " for < > 

" Smooth scrolling
" 3 parameters: distance, duration[ms], #lines
noremap <silent> <c-u> :call smooth_scroll#up	(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down	(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up	(&scroll, 15, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down	(&scroll, 15, 1)<CR>

" mru - most recently used
let MRU_Max_Entries = 10
"let MRU_Include_Files = '^/Users/ok/Dropbox/StageM2/report/.*'
" let g:MRU_File=expand("$HOME/.mru")
map :mru :MRU <CR>
nnoremap <Leader>mru :MRU<CR>
" nmap :MRU :mru <CR>
let MRU_Auto_Close = 1

" hi under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" OmniCppComplete ================
"
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
"autocmd filetype python set omnifunc=pythoncomplete#complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"set omnifunc=syntaxcomplete#Complete

" =========== Compile ================================
" If the " 'expandtab' " option is set, when you type a tab, " Vim " inserts spaces.This is not " good if you are editing a Makefile.To insert " a real tab, no matter " what the options are, " type in " CTRL-V<Tab> " in insert mode.The " CTRL-V " tells " Vim " not to mess with the fol- " lowing characte
"map <F9> : !gcc % && ./a.out <CR>
