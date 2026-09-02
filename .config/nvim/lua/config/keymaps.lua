vim.keymap.set("n", "<c-q>", "<cmd>q<cr>")
vim.keymap.set({ "n", "v", "i" }, "<c-s>", "<esc><cmd>w<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set('i', '<C-a>', '<C-o>I', { desc = 'Go to the start of the line' })
vim.keymap.set('i', '<C-e>', '<C-o>A', { desc = 'Go to the end of the line' })

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
vim.keymap.set("n", "[d", function()
  vim.diagnostic.goto_next()
end, { desc = "Jump to next diagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.goto_prev()
end, { desc = "Jump to previous diagnostic" })

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format()
end, { desc = "Format current file" })

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory in current window" })
vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in floating window" })

-- delete without changing the registers
vim.keymap.set({ "n", "x" }, "x", '"_x')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files({ hidden = true })
end, { desc = "Find files" })
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
end, { desc = "Find dotfiles" })

vim.keymap.set("n", "<leader>fn", function()
  builtin.find_files({ cwd = "~/dropbox/faldkasse/notes/", hidden = true })
end, { desc = "Find Notes" })

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

-- nvim-treesitter/nvim-treesitter-textobjects
vim.keymap.set({ "x", "o" }, "am", function()
require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
vim.keymap.set({ "x", "o" }, "as", function()
require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
end)

