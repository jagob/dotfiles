source ~/.vimrc

call plug#begin('~/.vim/plugged')
    source ~/dotfiles/.vim/plugins.vim

    " https://github.com/stefandtw/quickfix-reflector.vim
    " https://github.com/gabrielpoca/replacer.nvim

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " LSP plugins
    Plug 'williamboman/mason.nvim'
   " , opts = { ensure_installed = { "black", "debugpy", "mypy", "ruff", "pyright" } }
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
    Plug 'stevearc/conform.nvim'

    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    " https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    " https://github.com/p00f/nvim-ts-rainbow

    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'rose-pine/neovim'
    Plug 'savq/melange-nvim'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'catppuccin/nvim'
    Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
    " Plug 'norcalli/nvim-colorizer.lua'

    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'jay-babu/mason-nvim-dap.nvim'
    Plug 'folke/neodev.nvim'

    " Plug 'akinsho/bufferline.nvim'  "  maybe move to std vim
    Plug 'ThePrimeagen/harpoon'
    Plug 'folke/which-key.nvim'
call plug#end()

if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
else
  let g:python3_host_prog = '/usr/bin/python3'
endif

let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0


lua << EOF
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
EOF

" Loads lua config
" lua require('jagob')
lua require('jagob/cmp')
" lua require('jagob/lsp')
lua require('jagob/telescope')
lua require('jagob/treesitter')
" lua require('jagob/bufferline')
" lua require('jagob/whichkey')
" lua require('dap-python').setup('~/miniconda3/envs/py38/bin/python')
" lua require("dapui").setup()
" lua require("colorizer").setup()
lua require('jagob/keymaps')
lua require('jagob/lsp')
lua require('jagob/null-ls')
lua require('jagob/dap')




lua << EOF


vim.o.termguicolors = true

-- require("conform").setup({
--   formatters_by_ft = {
--     python = { "black", "isort" },
--   },
--   -- args not working...
--   formatters = {
--       -- black = { extra_args = { "--skip-string-normalization", "--line-length=100", "$FILENAME" } },
--       -- black = { args = { "--skip-string-normalization", "--line-length=100", "$FILENAME" } },
--       -- black = { prepend_args = { "--skip-string-normalization", "--line-length=100"} },
--   },
--   format_on_save = {
--     async = false,
--     timeout_ms = 500,
--     lsp_fallback = true,
--   },
-- })


EOF

 " require('neodev').setup()
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
