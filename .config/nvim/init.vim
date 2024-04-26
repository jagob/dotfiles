" auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has("unix")
    source ~/.vimrc
elseif has("win64") || has("win32")
    source C:\Users\jacob\dotfiles\.vimrc
endif

let plugged_dir = has('unix') ? '~/.vim/plugged' : '~/vimfiles/plugged'
call plug#begin(plugged_dir)
    source ~/dotfiles/.vim/plugins.vim

    " https://github.com/stefandtw/quickfix-reflector.vim
    " https://github.com/gabrielpoca/replacer.nvim

    " LSP plugins
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    " Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'

    " cmp plugins
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    Plug 'jose-elias-alvarez/null-ls.nvim'
    " Plug 'stevearc/conform.nvim'

    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    " https://github.com/p00f/nvim-ts-rainbow

    " colorschemes
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'rose-pine/neovim'
    Plug 'savq/melange-nvim'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'catppuccin/nvim'
    Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'Mofiqul/dracula.nvim'
    " Plug 'norcalli/nvim-colorizer.lua'

    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'nvim-neotest/nvim-nio'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'jay-babu/mason-nvim-dap.nvim'
    Plug 'folke/neodev.nvim'

    " Plug 'akinsho/bufferline.nvim'  "  maybe move to std vim
    Plug 'ThePrimeagen/harpoon'
    Plug 'folke/which-key.nvim'
call plug#end()

if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
elseif has("win64") || has("win32")
  let g:python3_host_prog = 'C:\Users\jacob\miniconda3\envs\py38\python.exe'
else
  let g:python3_host_prog = '/usr/bin/python3'
endif

let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" IMPORTANT: make sure to setup neodev BEFORE lspconfig
lua require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })

" Loads lua config
lua require('jagob/cmp')
" lua require('jagob/lsp')
lua require('jagob/telescope')
lua require('jagob/treesitter')
" lua require('jagob/bufferline')
" lua require('jagob/whichkey')
" lua require("colorizer").setup()
lua require('jagob/keymaps')
lua require('jagob/lsp')
lua require('jagob/null-ls')
lua require('jagob/dap')

lua << EOF
vim.o.termguicolors = true
EOF

" require("conform").setup({
"   formatters_by_ft = {
"     python = { "black", "isort" },
"   },
"   -- args not working...
"   formatters = {
"       -- black = { extra_args = { "--skip-string-normalization", "--line-length=100", "$FILENAME" } },
"       -- black = { args = { "--skip-string-normalization", "--line-length=100", "$FILENAME" } },
"       -- black = { prepend_args = { "--skip-string-normalization", "--line-length=100"} },
"   },
"   format_on_save = {
"     async = false,
"     timeout_ms = 500,
"     lsp_fallback = true,
"   },
" })

" let g:nvcode_termcolors=256
" syntax on
" colorscheme nvcode " Or whatever colorscheme you make
" " checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif

" For opencv2 completion
" activate env
" pip install mypy
" cd /home/jacob/miniconda3/envs/pytorch-cpu/lib/python3.10/site-packages/cv2
" stubgen -m cv2 -o .
" cp cv2.pyi __init__.py
