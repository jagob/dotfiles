" github.com/jagob
" for windows _vimrc -> source ~\dotfiles\.vimrc
    
filetype off
set nocompatible                "no vi emulation

" auto-install vim-plug
if has("unix")
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif
    let plugged_dir = '~/.vim/plugged'
elseif has("win64") || has("win32")
    if empty(glob('C:\Users\jacob\vimfiles\autoload\plug.vim'))
        silent !curl -fLo C:\Users\jacob\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif
    let plugged_dir = '~/vimfiles/plugged'
endif

call plug#begin(plugged_dir)
    source ~/dotfiles/.vim/plugins.vim
    if !has('nvim')  "vim exclusive plugins (not neovim)
        Plug 'mileszs/ack.vim'
        Plug 'dense-analysis/ale'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim' 
        set pastetoggle=<F2>
    endif
call plug#end()
  
" windows stuff
" let $PYTHONHOME = 'C:/Users/UserName/AppData/Local/Continuum/Anaconda2/'
" let $PYTHONHOME = 'C:/Python27/'

" if has("gui_running")
"     set guioptions-=T " Hide the toolbar.
" endif

" filetype plugin indent on
syntax on

if has('termguicolors')
  set termguicolors
endif

if has("win64") || has("win32")
    let s:vim_cache = expand('$HOME/vimfiles')
    " set guifont=Consolas:h12
    " colorscheme jagob-gruvbox
    " set background=light
    " colorscheme solarized
    " let &pythonthreedll = 'C:\Program Files (x86)\Python36-32\Python36.dll'
endif
if has("unix")
    " let s:vim_cache = expand('$HOME/.vim')
    " set background=light
    " colorscheme jagob-delight
    " set background=dark
    " set t_Co=256 "set t_Co=16
    " colorscheme jagob-gruvbox
    set background=dark
    " Set contrast.
    " This configuration option should be placed before `colorscheme gruvbox-material`.
    " Available values: 'hard', 'medium'(default), 'soft'
    let g:gruvbox_material_background = 'medium'
    " For better performance
    let g:gruvbox_material_better_performance = 1
    colorscheme gruvbox-material
endif
if $SSH_CONNECTION
    set background=dark
    " set t_Co=256 "set t_Co=16
    colorscheme jagob-gruvbox
endif
colorscheme gruvbox-material


" " let g:nvcode_termcolors=256
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif
" " set notermguicolors

" Disable XOFF/XON
silent !stty -ixon

let mapleader = " "
set number
" set number relativenumber       " relative hybrid numbers
set numberwidth=3
" set signcolumn=number         " Put signs in linenumbers instead of signcolumn
set signcolumn=yes
" set signcolumn=yes:1
set backspace=indent,eol,start  " Allow backspace in insert mode
set gcr=a:blinkon0              " Disable cursor blink
set mouse=a                     " Enable mouse
set visualbell                  " No sounds
set t_vb=                       " No blink at first/last line
set autoread                    " Reload files changed outside vim

set nofoldenable
" set foldenable
" set foldmethod=syntax   " syntax,manual,indent
" set foldcolumn=2
" set foldlevel=1
" set foldclose=all

" timeoutlen defaults to 1000 and is the delay in milliseconds that vim uses when checking for map key sequences. It’s also used when checking keycodes if ttimeoutlen is disabled
" set timeoutlen =1000
set ttimeoutlen=0

" au BufRead /tmp/mutt-* set tw=72 " textwrap for mutt
" set textwidth=80 " set textwidth to 80 to cause wrapping
set nowrap
set linebreak       " wrap at 'breakat' instead of last char
set history=1000    " command lines history
set nojoinspaces    " only put one space after periods

set hlsearch        " hilight all words
set incsearch       " seach as you type
set ignorecase      " Autocompletion try all words regardless of case
set smartcase       " if capital letters become case sensitive
set showmatch       " show matching parenthesis

" Turn off Swap Files
set noswapfile
set nobackup
set nowb
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" to keep fold history
" au BufWinLeave * silent! mkview	" save buffer view on exit
" au BufWinEnter * silent! loadview " restore buffer view on enter

" Scrolling
set scrolloff=8         "Start scrolling when we're 7 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Statusline
"highlight StatusLine ctermfg=blue ctermbg=yellow " Highlight the status line
set laststatus=2 " for powerline
" set guifont=Liberation\ Mono\ for\ Powerline\ 10 
" let g:Powerline_symbols = 'fancy'
" set guifont=Consolas:h14

" Soeren tabs
set tabstop=4       " tab width
set shiftwidth=4    " indention
set softtabstop=4   " backspace deletes indents
set expandtab       " use spaces
set autoindent      " autoindent

" listchar tab wont work with expandtab
" set list
set encoding=utf-8
" set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" exec "set list lcs=tab:»~,trail:¬,nbsp:▸"

" Colors
" let g:solarized_termcolors=256
" set t_Co=256 "set t_Co=16
" set background=light
" colorscheme solarized
" colorscheme jagob-delight

" mark line 80
" highlight ColorColumn ctermbg=233
highlight ColorColumn ctermbg=0 
autocmd filetype python,markdown set colorcolumn=80
autocmd filetype python,markdown set colorcolumn=100

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

" autocmd FileType tex setlocal spell spelllang=en_gb,da
autocmd FileType tex setlocal spell spelllang=en_us,da
autocmd FileType mail set spell

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

" build current with leader ll, \LL
" nnoremap <leader>ls :silent call Tex_RunLaTeX()<cr>
nnoremap <leader>b :silent call Tex_RunLaTeX()<cr>
let g:Tex_UseMakefile=1

"   Compile LaTeX for the current file only
function! LatexCurrent()
    let a:localLatexCommand = 'echo '
    let a:localLatexCommand .= '\\input{setup/preamble}'
    let a:localLatexCommand .= '\\input{setup/macros}'
    " let a:localLatexCommand .= '\\input{setup/listings}'
    let a:localLatexCommand .= '\\\\begin{document}'
    let a:localLatexCommand .= '\\pagenumbering{arabic}\\input{'
    let a:curfile = expand('%:p')
    let a:localLatexCommand .= a:curfile
    let a:localLatexCommand .= '}\\\\end{document}'
    let a:localLatexCommand .= '> /home/jacob/work/pr_rgbd_chicken_extension/masterlocal.tex'

    echom system(a:localLatexCommand)
    execute "!cd /home/jacob/work/pr_rgbd_chicken_extension/ && pdflatex -shell-escape masterlocal.tex"
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
" inoremap jk <ESC>

" map :Q :q<CR>
" map :W :w<CR>
map <C-q> :q<CR>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" Remap line motion Practical vim page 111
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap <Down> gj
nnoremap <Up> gk

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap("<C-d>", "<C-d>zz") 
nnoremap("<C-u>", "<C-u>zz") 
" Smooth scrolling
" 3 parameters: distance, duration[ms], #lines
" noremap <silent> <c-u> zz<bar>:call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> zz<bar>:call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> zz<bar>:call smooth_scroll#up(&scroll, 7, 1)<CR>
" noremap <silent> <c-f> zz<bar>:call smooth_scroll#down(&scroll, 7, 1)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll, 7, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll, 7, 1)<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"open new terminal
nnoremap <buffer> <F3> :exec '!urxvt &' shellescape(@%, 1)<cr>"

noremap <F4> :silent noh<CR>
noremap <leader>h :silent noh<CR>
" keymap('n', '<leader><CR>', '<cmd>noh<CR>')
map     <F6>      :set list!<CR>:set list?<CR>
imap    <F6> <C-O>:set list!<CR><C-O>:set list?<CR>

" map copy cut & paste to what they bloody should be
vnoremap <C-c> "+y" copy
map <C-v> "+gP" paste
imap <C-v> <Esc>"+gP" paste
" vnoremap <C-x> "+x " cut
" clipboard=unnamed
" clipboard^=unnamed " for arch linux, see :h clipboard-exclude 
" set clipboard=unnamed
set clipboard=unnamedplus

" # copy asbjornHaland, separate normal y yank and system yank using leader
" nnoremap <leader>y "+y"
" vnoremap <leader>y "+y"
" nnoremap <leader>Y "+Y"
" delete into void
nnoremap <leader>d "\"_d"
vnoremap <leader>d "\"_d"

" " greatest remap ever
" xnoremap("<leader>p", "\"_dP")
" " next greatest remap ever : asbjornHaland
" nnoremap("<leader>y", "\"+y")
" vnoremap("<leader>y", "\"+y")
" nmap("<leader>Y", "\"+Y")
" nnoremap("<leader>d", "\"_d")
" vnoremap("<leader>d", "\"_d")
" vnoremap("<leader>d", "\"_d")

nnoremap <leader>w :set wrap!<CR>

" Smart way to move between windows
" let g:BASH_Ctrl_j = 'off' " to map j
nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward "latexsuite wont override j map
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" map <C-m> <C-W>h
" map <C-n> <C-W>j
" map <C-e> <C-W>k
" map <C-i> <C-W>l  " conflict with prev jumplist C-i and C-o
map <C-W>m <C-W>h
map <C-W>n <C-W>j
map <C-W>e <C-W>k
map <C-W>i <C-W>l

" Buffer taken from Practical Vim page 78
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader><Tab> :bn<CR>
nnoremap <Leader><backspace> :bp<CR>
" nmap <leader>1 :bp<CR>
" nmap <leader>2 :bn<CR>
" nnoremap <leader>p :bprevious<CR>
" nnoremap <leader>n :bnext<CR>
" nnoremap <silent> [b :bprevious<CR>
" nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> [B :bfirst<CR>
" nnoremap <silent> ]B :blast<CR>

" tabs
" gt - next tab
" gT - previous tab
" {i}gt - go to tab in position i
nnoremap <tab> :tabnext<cr>
nnoremap <S-tab> :tabprev<cr>
for i in range(1, 9)
    execute 'nnoremap <leader>' . i . ' ' . i . 'gt'
endfor
" nnoremap <C-t> <esc>:tabnew<cr>  " jump taglist
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tc :tabnew<cr>
nnoremap <leader>tj <esc>:tabnext<cr>
nnoremap <leader>tk <esc>:tabprevious<cr>
nnoremap <leader>th <esc>:tabmove -1 <cr>
nnoremap <leader>tl <esc>:tabmove +1 <cr>
nnoremap <leader>tn <esc>:tabnext<cr>
nnoremap <leader>tp <esc>:tabprevious<cr>
nnoremap <leader>tm <esc>:tabmove -1 <cr>
nnoremap <leader>ti <esc>:tabmove +1 <cr>
" nnoremap <C-Tab> :tabn<CR>
" nnoremap <C-S-Tab> :tabp<CR>"
" noremap <C-Tab> :tabnext<CR>
" noremap <C-S-Tab> :tabprev<CR>"
" " old qwerty tab bindings
" map <C-n> <esc>:tabnext<cr>
" map <C-p> <esc>:tabprevious<cr>
" map <C-m> <esc>:tabmove +1 <cr>

" Only use Block Visual mode
nnoremap v <C-V>
vnoremap v <C-V>
" nnoremap <C-V>  v
" vnoremap <C-V>  v
" Stay in visual mode when indenting with < >
vnoremap > >gv
vnoremap < <gv
vnoremap J :m '>+1<CR>gv=gv'
vnoremap K :m '<-2<CR>gv=gv'

" marks
" ]' - previous mark (local)
" [' - next mark (local)
" '. - position of where last change was made
" '' - position before last jump (Super useful!). See :h ''
" show a lists of marks
nnoremap <silent> <leader>m <cmd>marks<cr>
" :delm[arks] 0-9 a-z A-Z \"<>.  " delete marks

" save read-only files
cmap w!! %!sudo tee > /dev/null %

" word count
" g C-G

" " nnoremap <leader>win :%s/M]//g
" nnoremap <leader>win :%s/
" nnoremap <leader>gc :!gcc % -o %<
" nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>"
" nnoremap <buffer> <F9> :!python % <cr>"
autocmd BufRead *.py nmap <F5> :!python2 %<CR>
"map <F9> : !gcc % && ./a.out <CR>
nnoremap <F5> :make!<cr>

" Rename variables
" https://stackoverflow.com/questions/597687/changing-variable-names-in-vim 
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" hilight word type under cursor
map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" " Plugins ------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
" let g:airline#extensions#tabline#enabled = 1  " display top tab bar

" " CtrlP, outdated, use fzf
" let g:ctrlp_map = '<c-o>'

" fzf
" replace CtrlP, including key map
nnoremap <C-p> :Files<CR>
" map <C-o> :Files<CR>
" keybind not working
" nnoremap <C-o> :Files<CR>
" let g:fzf_layout = { 'down': '40%' }

" NERDTree "autocmd vimenter * NERDTree
" nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>tr :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" " Taglist - use space to see arguments
" map <leader>tl :TlistToggle <cr>
" let Tlist_WinWidth = 30
" let Tlist_File_Fold_Auto_Close = 1
" tagsbar
nmap <F8> :TagbarToggle<CR>


" " TComment
" map <leader>c :TComment<cr>

" vim-commentary
noremap <leader>c :Commentary<cr>

" easyalign
" to align latex tables: visuble mark the rows
" :EasyAlign *&

" " Surround
" ds"  " delete surrounding quotes

" " delimitMate
" let delimitMate_expand_cr = 2
" let delimitMate_expand_space = 1

" Rainbow Parentheses
" Left column is for terminal environment
" Right column is for GUI environment
let g:rbpt_colorpairs = [
	\ ['darkblue',    '#d65d0e'],
	\ ['darkmagenta', '#fabd2f'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound     " ()
au Syntax * RainbowParenthesesLoadSquare    " []
au Syntax * RainbowParenthesesLoadBraces    " {}
" au Syntax * RainbowParenthesesLoadChevrons " <> 

" undotree
nnoremap <F7> :UndotreeToggle<CR>

" vimdiff
" do - Get changes from other window into the current window.
" dp - Put the changes from current window into the other window.
" Ctrlww - change window.
" :diffupdate will re-scan the files for changes (Vim can get confused, and show bogus stuff).

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
" s - stage
" u - undo
" '-' - add/remove file to/from staging 
" dd - diff mode two splits
" C - commit
" cc - commit
" ca - commit amend
" :Gcommit<CR>
" :Gpush
" X - discard changes
" bash
" alias gs='vim +0Git "+normal gU"'
" In .vimrc:
" nnoremap <leader>gs :0Git<cr>:normal gU<cr>

" " git gutter
" jump between hunks with [c and ]c. 
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
" preview, stage, and undo hunks with <leader>hp, <leader>hs, and <leader>hu respectively.
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)"
" https://vi.stackexchange.com/questions/15450/vim-mapping-delayed-because-of-plugin
" nmap <leader>gsh <Plug>GitGutterStageHunk
" nmap <plug>(disable-ggsh) <Plug>GitGutterStageHunk
let g:gitgutter_map_keys = 0  " no gitgutter binds interferring with no highlight
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'

" IndentLine ¦ ┆ │
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
" the plugin will not function if conceallevel is not set to 1 or 2.
let g:indentLine_setConceal = 1

" " UltiSnippet - better key bindings for UltiSnipsExpandTrigger
" :UltiSnipsEdit  # add/edit custom snippets for the current filetype
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsUsePythonVersion=3

" ctags
" Generate a .tags file, which vim can use to scan for keywords
" ctags -R --exclude=.git--exclude=vendor --exclude=node_modules --exclude=db --exclude=log .
" map <f12> :!ctags -R .<cr> 
map <f12> :!ctags -R --exclude=node_modules .<cr> 

" use ctrl+] to jump to definition, in a new tab
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" g+ctrl+] to list all definitions
" ctrl+t to jump back

" CSV 
let g:csv_no_conceal = 0
" json
" let g:vim_json_syntax_conceal = 0
au FileType json set conceallevel=0
let g:tex_conceal=""

" Ale
let b:ale_linters = ['flake8', 'pylint']"
let g:ale_lint_on_text_changed = 'always' 
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_python_pylint_change_directory = 0

" markdown
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
au FileType markdown setlocal foldlevel=2

" " tmux
" let g:tmux_navigator_disable_when_zoomed = 1 
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" " nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" nnoremap <silent> <C-m> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-n> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-e> :TmuxNavigateUp<cr>
" " nnoremap <silent> <C-i> :TmuxNavigateRight<cr>
" nnoremap <silent> \033[a6i :TmuxNavigateRight<cr>
" nnoremap <silent> <C-o> :TmuxNavigateRight<cr>


" OmniCppComplete -----------------------------------------------------------
set omnifunc=syntaxcomplete#Complete
" autocmd filetype python set omnifunc=pythoncomplete#complete
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP

" YouCompleteMe
" Also checkout VimCompletesMe
" let g:ycm_python_binary_path = '/usr/bin/python2' 
" let g:ycm_server_python_interpreter = '/usr/bin/python3'

" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_autoclose_preview_window_after_completion=1
" " let g:ycm_global_ycm_extra_conf = '~/downloads/ycm_extra_conf.py'
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:ycm_use_ultisnips_completer = 2
" " disable for tex files
" let g:ycm_filetype_blacklist = {
"             \ 'tex' : 1,
"             \ 'plaintex' : 1
"             \}
" let g:ycm_keep_logfiles = 1

" " Syntastic --------------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height = 5

" let g:syntastic_python_checkers = ['flake8']  " flake8, pyflakes, pylint, python
" let g:syntastic_quiet_messages = { "type": "style" }    " Disable style messages
" let g:syntastic_python_flake8_args = '--ignore="E901"'
" let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801,E303,E211,E901"'
" map <silent> <Leader>e :Errors<CR>
" map <Leader>s :SyntasticToggleMode<CR>

" " Coc
" set signcolumn=yes

" Kite autocomplete
" let g:kite_auto_complete=0


" " old plugin ---------------------------------------------------------------
" " FuzzyFinder
" map <C-o> :FufCoverageFile<CR> 
" let g:fuf_coveragefile_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.class$'

" " mru - most recently used
" let MRU_Window_Height = 15 
" let MRU_Max_Entries = 15
" let MRU_Auto_Close = 1
" map :mru :MRU <CR>
" " map <C-m> :MRU <CR>
" nnoremap <Leader>mru :MRU<CR>
" " nmap :MRU :mru <CR>
" " let MRU_Include_Files = '^/Users/ok/Dropbox/StageM2/report/.*'
" " let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

" " easymotion
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" " Search for 1 character
" " nmap <space> <Plug>(easymotion-overwin-f)
" " Search for 2 characters
" " nmap s <Plug>(easymotion-overwin-f2)
" " Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

" " dragvisuals.vim
" vmap <expr> <LEFT>  DVB_Drag('left')
" vmap <expr> <RIGHT> DVB_Drag('right')
" vmap <expr> <DOWN>  DVB_Drag('down')
" vmap <expr> <UP>    DVB_Drag('up')
" vmap <expr> D       DVB_Duplicate()
"
" " vmath.vim sum average min max
" " Fix this
" vmap <expr> ++ VMATH_YankAndAnalyse()
" vmap <C-æ> VMATH_YankAndAnalyse()
" nmap        ++ vip++
