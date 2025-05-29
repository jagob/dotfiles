vim.keymap.set("n", "<c-q>", "<cmd>q<cr>")
vim.keymap.set({ "n", "v", "i" }, "<c-s>", "<esc><cmd>w<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<c-w>", "<cmd>set wrap!<cr>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- navigating splits (colemak)
-- ctrl arrow keys dont work
-- ctrl m dont work
vim.keymap.set("n", "<c-n>", "<c-w><c-j>")
vim.keymap.set("n", "<c-e>", "<c-w><c-k>")
-- vim.keymap.set("n", "<c-m>", "<cmd>wincmd l<cr>")
-- vim.keymap.set("n", "<c-i><c-i>", "<c-w><c-h>")
-- vim.keymap.set("n", "<c-i>", "<c-w><c-l>")  -- collide with jump

-- buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")
vim.keymap.set("n", "<leader><tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader><backspace>", "<cmd>bp<cr>")

-- diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>l", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

-- vim.keymap.set("n", "[d", function()
-- 	vim.diagnostic.goto_next()
-- end, { desc = "Jump to next diagnostic" })
-- vim.keymap.set("n", "]d", function()
-- 	vim.diagnostic.goto_prev()
-- end, { desc = "Jump to previous diagnostic" })

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "Format current file" })

-- Open parent directory in current window
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Open parent directory in floating window
vim.keymap.set("n", "<space>-", require("oil").toggle_float)

-- copy paste
-- "*p for pasting
-- vim.keymap.set("v", "<C>-c", "+y copy")
--
-- -- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
--
-- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Copy/paste from system clipboard
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')
-- Delete without changing the registers
vim.keymap.set({ "n", "x" }, "x", '"_x')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Old files" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>gw", builtin.grep_string, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>ft", function()
  return builtin.git_files({ cwd = vim.fn.expand("%:h") })
end)
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>en", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config"), hidden = ture })
end)

vim.keymap.set("n", "<leader>fd", function()
  builtin.find_files({ cwd = "~/dotfiles/", hidden = true })
end)

-- local ui = require("harpoon.ui")
-- -- I and O clashes with jump list
-- vim.keymap.set("n", "<leader>n", require("harpoon.mark").add_file)
-- vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu)
-- vim.keymap.set("n", "<C-n>", function()
--   ui.nav_file(1)
-- end)
-- vim.keymap.set("n", "<C-e>", function()
--   ui.nav_file(2)
-- end)
-- vim.keymap.set("n", "<C-h>", function()
--   ui.nav_file(3)
-- end)
-- vim.keymap.set("n", "<C-,>", function()
--   ui.nav_file(4)
-- end)

-- local dap = require("dap")
-- local dapui = require("dapui")
-- vim.keymap.set("n", "<leader>da", dapui.toggle)
-- vim.keymap.set("n", "<leader>dd", dap.toggle_breakpoint)
-- vim.keymap.set("n", "<leader>dc", dap.continue)
-- vim.keymap.set("n", "<leader>dn", dap.step_over)
-- vim.keymap.set("n", "<leader>ds", dap.step_into)
-- vim.keymap.set("n", "<leader>dx", dap.terminate)
-- -- vim.keymap.set("n", "<leader>bk", dap.step_out)
-- -- vim.keymap.set("n", "<leader>bh", dap.step_back)
-- vim.keymap.set("n", "<leader>d.", dap.run_last)
-- vim.keymap.set("n", "<leader>dk", require("dap-python").test_method)
-- vim.keymap.set("n", "<leader>dm", require("dap-python").test_class)
-- -- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
-- -- vim.keymap.set("n", "<leader>br", dapui.open({ reset = true }))
-- -- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
