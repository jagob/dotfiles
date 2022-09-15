set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
    source ~/dotfiles/.vim/plugins.vim
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
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
lua require('jagob')
" lua require('jagob/init')
" lua require('jagob/telescope')
lua require('jagob/null-ls')
"
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- ["<C-p>"] = cmp.mapping.select_prev_item(),
      -- ["<C-n>"] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- elseif require("luasnip").expand_or_jumpable() then
        --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        -- elseif require("luasnip").jumpable(-1) then
        --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end,

      -- ["<Tab>"] = cmp.mapping(
      --   function(fallback)
      --     cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      --   end,
      --   { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
      -- ),
      -- ["<S-Tab>"] = cmp.mapping(
      --   function(fallback)
      --     cmp_ultisnips_mappings.jump_backwards(fallback)
      --   end,
      --   { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
      -- ),

      -- -- ['<Tab>'] = cmp.config.disable,
      -- -- ['<S-Tab>'] = cmp.config.disable,
      -- -- start luasnip
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      --   if luasnip.expand_or_jumpable() then
      --     luasnip.expand_or_jump()
      --   elseif cmp.visible() then
      --     cmp.confirm({ select = true})
      --   else
      --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      --   end
      -- end, { "i", "s" }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if luasnip.jumpable(-1) then
      --     luasnip.jump(-1)
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
      { name = 'nvim_lsp_signature_help' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
EOF

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

"" coc
"set cmdheight=2
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=400
"set shortmess+=c
"" let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-snippets', 'coc-python', 'coc-jedi']  " pacman -S npm
"let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-snippets', 'coc-python', 'coc-pyright']  " pacman -S npm python-pylint
""  coc-markdownlint for markdown linting
"" coc-markdown-preview-enhanced Markdown Preview Enhanced for coc.nvim
""
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ CheckBackSpace() ? "\<TAB>" :
"      \ coc#refresh()

"" " use <tab> for trigger completion and navigate to the next complete item
"" inoremap <silent><expr> <Tab>
""       \ coc#pum#visible() ? coc#pum#next(1) :
""       \ CheckBackspace() ? "\<Tab>" :
""       \ coc#refresh()

"function! CheckBackSpace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" let g:coc_snippet_next = '<tab>'

"" inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"" inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"" go to return

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)


" " faster highlighting
" local autocmd = vim.api.nvim_create_autocmd
" local yank_group = augroup('HighlightYank', {})
" autocmd('TextYankPost', {
"     group = yank_group,
"     pattern = '*',
"     callback = function()
"         vim.highlight.on_yank({
"             higroup = 'IncSearch',
"             timeout = 40,
"         })
"     end,
" })
