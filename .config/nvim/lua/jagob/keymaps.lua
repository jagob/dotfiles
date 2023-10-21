-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>*', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>n", mark.add_file)
vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-e>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-,>", function() ui.nav_file(4) end)
-- nnoremap <leader>l <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
-- nnoremap <leader>n <cmd>lua require("harpoon.mark").add_file()<CR>
-- nnoremap <C-n> <cmd>lua require("harpoon.ui").nav_file(1)<CR>
-- nnoremap <C-e> <cmd>lua require("harpoon.ui").nav_file(2)<CR>
-- nnoremap <C-h> <cmd>lua require("harpoon.ui").nav_file(3)<CR>
-- nnoremap <C-,> <cmd>lua require("harpoon.ui").nav_file(4)<CR>
-- nnoremap <C-i> <cmd>lua require("harpoon.ui").nav_file(3)<CR>  " I and O clashes with jump list
-- nnoremap <C-o> <cmd>lua require("harpoon.ui").nav_file(4)<CR>

-- nnoremap <leader>ft <cmd>Telescope find_files<cr>
-- nnoremap <leader>fp <cmd>Telescope git_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-- nnoremap <leader>fd <cmd>lua require('jagob.telescope').search_dotfiles({hidden = true})<CR>
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sd', require('jagob.telescope').search_dotfiles, { desc = '[S]earch [D]otfiles' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Treesitter diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.buf.type_definition()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "function() vim.lsp.buf.format { async = true } end", opts)
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end
nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

-- Lesser used LSP functionality
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {desc = 'Format Code'})
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- additional keymaps in treesitter
