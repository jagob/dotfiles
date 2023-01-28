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
    Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
    " Plug 'SirVer/ultisnips'  " import from common plugins
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    Plug 'jose-elias-alvarez/null-ls.nvim'

    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    " https://github.com/p00f/nvim-ts-rainbow

    " Plug 'akinsho/bufferline.nvim'  "  maybe move to std vim
    Plug 'ThePrimeagen/harpoon'
    Plug 'folke/which-key.nvim'
call plug#end()

" Loads lua config
" lua require('jagob')
lua require('jagob/cmp')
lua require('jagob/lsp')
lua require('jagob/telescope')
" lua require('jagob/bufferline')
" lua require('jagob/whichkey')

let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

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
