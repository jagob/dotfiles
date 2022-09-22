set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
    source ~/dotfiles/.vim/plugins.vim

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
    " Plug 'SirVer/ultisnips'  " import from common plugins
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    Plug 'jose-elias-alvarez/null-ls.nvim'

    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    " https://github.com/p00f/nvim-ts-rainbow
call plug#end()

" Loads lua config
" lua require('jagob')
lua require('jagob/cmp')
lua require('jagob/lsp')
lua require('jagob/telescope')
"
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fp <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>lua require('jagob.telescope').search_dotfiles({hidden = true})<CR>

" For opencv2 completion
" activate env
" pip install mypy
" cd /home/jacob/miniconda3/envs/pytorch-cpu/lib/python3.10/site-packages/cv2
" stubgen -m cv2 -o .
" cp cv2.pyi __init__.py
