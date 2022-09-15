require'lspconfig'.pyright.setup{}

-- :LspInfo  -- check for running in single mode
local configs = require 'lspconfig.configs'
-- Check if the config is already defined (useful when reloading this file)
if not configs.foo_lsp then
  configs.foo_lsp = {
    default_config = {
      -- cmd = {'/home/neovim/lua-language-server/run.sh'},
      -- filetypes = {'lua'},
      -- root_dir = function(fname)
      --   return lspconfig.util.find_git_ancestor(fname)
      -- end,
      filetypes = { "python" },
      root_dir = function(fname)
          local root_files = {
              'pyproject.toml',
              'setup.py',
              'setup.cfg',
              'requirements.txt',
              'Pipfile',
              'pyrightconfig.json',
          }
          return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
      end,
      -- root_dir = util.root_pattern('pyproject.toml', 'requirements.txt')
      -- settings = {},
    },
  }
end


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- -- https://github.com/davidcortesortuno/dotfiles/blob/749656e971e1e1e02a7a7944eaf6e69ba722f03f/nvim/init.vim#L145 
-- -- lsp installer
-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--   	on_attach = my_custom_on_attach,
--   	capabilities = capabilities,
--   }

--   -- (optional) Customize the options passed to the server
--   -- if server.name == "tsserver" then
--   --     opts.root_dir = function() ... end
--   -- end
--   if server.name == "pyright" then
--       -- print(opts.filetypes)
--       -- opts.filetypes.python = "flake8"
--   end

--   if server.name == "diagnosticls" then
--     opts.settings = {
--       filetypes = { python = {"flake8"} },
--       linters = {
--         flake8 = {
--           debounce = 100,
--           sourceName = "flake8",
--           command = "flake8",
--           args = {
--             "--format",
--             "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
--             "%file",
--           },
--           formatPattern = {
--             "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
--             {
--                 line = 1,
--                 column = 2,
--                 message = {"[", 3, "] ", 5},
--                 security = 4
--             }
--           },
--           securities = {
--             E = "error",
--             W = "warning",
--             F = "info",
--             B = "hint",
--           },
--         },
--       }
--     }
--   end

--   -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
--   server:setup(opts)
--   vim.cmd [[ do User LspAttachBuffers ]]
-- end)

