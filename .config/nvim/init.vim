set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
    source ~/dotfiles/.vim/plugins.vim

    " https://github.com/stefandtw/quickfix-reflector.vim
    " https://github.com/gabrielpoca/replacer.nvim

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " LSP plugins
    Plug 'williamboman/nvim-lsp-installer'
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

    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    " https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    " https://github.com/p00f/nvim-ts-rainbow
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'rose-pine/neovim'
    Plug 'savq/melange-nvim'
    Plug 'rebelot/kanagawa'

    " Plug 'mfussenegger/nvim-dap'
    " Plug 'mfussenegger/nvim-dap-python'
    " Plug 'rcarriga/nvim-dap-ui'

    " Plug 'akinsho/bufferline.nvim'  "  maybe move to std vim
    Plug 'ThePrimeagen/harpoon'
    " Plug 'folke/which-key.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
else
  let g:python3_host_prog = '/usr/bin/python3'
endif

let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" Loads lua config
" lua require('jagob')
lua require('jagob/cmp')
lua require('jagob/lsp')
lua require('jagob/telescope')
lua require('jagob/treesitter')
" lua require('jagob/bufferline')
" lua require('jagob/whichkey')
" lua require('dap-python').setup('~/miniconda3/envs/py38/bin/python')
" lua require("dapui").setup()
lua require("colorizer").setup()


lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

" let g:nvcode_termcolors=256
" syntax on
" colorscheme nvcode " Or whatever colorscheme you make
" " checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ft <cmd>Telescope find_files<cr>
nnoremap <leader>fp <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>lua require('jagob.telescope').search_dotfiles({hidden = true})<CR>

nnoremap <leader>l <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>n <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <C-n> <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-e> <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-h> <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-,> <cmd>lua require("harpoon.ui").nav_file(4)<CR>
" nnoremap <C-i> <cmd>lua require("harpoon.ui").nav_file(3)<CR>  " I and O clashes with jump list
" nnoremap <C-o> <cmd>lua require("harpoon.ui").nav_file(4)<CR>

" For opencv2 completion
" activate env
" pip install mypy
" cd /home/jacob/miniconda3/envs/pytorch-cpu/lib/python3.10/site-packages/cv2
" stubgen -m cv2 -o .
" cp cv2.pyi __init__.py
