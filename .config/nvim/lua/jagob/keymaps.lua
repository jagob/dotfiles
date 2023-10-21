local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n', keys, func, { desc = desc })
end

local tscope = require('telescope.builtin')
-- See `:help telescope.builtin`
nmap('<leader>?',     tscope.oldfiles, '[ ? ] Find recently opened files')
nmap('<leader>so',    tscope.oldfiles, '[sr ] Find recently opened files')
nmap('<leader>sr',    tscope.oldfiles, '[so ] Find recently opened files')
nmap('<leader>*',     tscope.buffers,  '[ * ] Find existing buffers')
nmap('<leader><tab>', tscope.buffers,  '[tab] Find existing buffers')
nmap('<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tscope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 0,
    previewer = false,
  })
end, '[/] Fuzzily search in current buffer')

-- telescope
nmap('<C-p>',      tscope.find_files,  '[S]earch [F]iles')
nmap('<leader>sf', tscope.find_files,  '[S]earch [F]iles')
nmap('<leader>sp', tscope.git_files,   'Search Git Files')
nmap('<leader>sh', tscope.help_tags,   '[S]earch [H]elp')
nmap('<leader>sw', tscope.grep_string, '[S]earch [W]ord under cursor')
nmap('<leader>sg', tscope.live_grep,   '[S]earch by [G]rep')
nmap('<leader>sd', tscope.diagnostics, '[S]earch [D]iagnostics')
nmap('<leader>sr', tscope.resume,      '[S]earch [R]esume')
nmap('<leader>sc', require('jagob.telescope').search_dotfiles, '[S]earch [C]onfig')

-- Treesitter diagnostic keymaps
nmap('[d',        vim.diagnostic.goto_prev,  'Go to previous diagnostic message')
nmap(']d',        vim.diagnostic.goto_next,  'Go to next diagnostic message')
nmap('<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic message')
nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostics list')

-- lsp
nmap('gD',         vim.lsp.buf.declaration,              '[G]oto [D]eclaration')
nmap('gd',         tscope.lsp_definitions,               '[G]oto [D]efinition')
nmap('gr',         tscope.lsp_references,                '[G]oto [R]eferences')
nmap('gI',         tscope.lsp_implementations,           '[G]oto [I]mplementation')
nmap('<leader>D',  tscope.lsp_type_definitions,          'Type [D]efinition')
nmap('<leader>ds', tscope.lsp_document_symbols,          '[D]ocument [S]ymbols')
nmap('<leader>ws', tscope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
nmap('<leader>rn', vim.lsp.buf.rename,                   '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action,              '[C]ode [A]ction')
nmap('<leader>ff', vim.lsp.buf.format,                   'Format Code')
-- See `:help K` for why this keymap
nmap('K',          vim.lsp.buf.hover,                    'Hover Documentation')
nmap('<C-k>',      vim.lsp.buf.signature_help,           'Signature Documentation')
-- Lesser used LSP functionality
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder,     '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder,  '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.buf.type_definition()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "function() vim.lsp.buf.format { async = true } end", opts)
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- I and O clashes with jump list
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>n", require("harpoon.mark").add_file)
vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-e>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-,>", function() ui.nav_file(4) end)

local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<leader>da", dapui.toggle)
vim.keymap.set("n", "<leader>dd", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>ds", dap.step_into)
vim.keymap.set("n", "<leader>dx", dap.terminate)
-- vim.keymap.set("n", "<leader>bk", dap.step_out)
-- vim.keymap.set("n", "<leader>bh", dap.step_back)
vim.keymap.set("n", "<leader>d.", dap.run_last)
vim.keymap.set("n", "<leader>dk", require('dap-python').test_method)
vim.keymap.set("n", "<leader>dm", require('dap-python').test_class)
-- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
-- vim.keymap.set("n", "<leader>br", dapui.open({ reset = true }))
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)

-- additional keymaps in treesitter
