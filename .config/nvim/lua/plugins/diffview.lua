local function toggle_diffview(cmd)
  if next(require("diffview.lib").views) == nil then
    vim.cmd(cmd)
  else
    vim.cmd("DiffviewClose")
  end
end

return {
  'sindrets/diffview.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = true,
  command = "DiffviewOpen",
  cond = is_git_root,
  -- keys = {
  --   { '<leader>hd', '<cmd>DiffviewOpen -uno<CR>', desc = 'git diff against index' },
    -- { '<leader>vd', '<cmd>DiffviewOpen <CR>', desc = "Diff Index", },
  -- },
  keys = {

-- ]c: Jump to the next hunk.
-- [c: Jump to the previous hunk.
-- <tab>: Cycle to the next diff/panel.
-- <s-tab>: Cycle to the previous diff/panel.
-- q or <cmd>DiffviewClose<cr>: Close the current diffview.
-- File Panel Keymaps<cr> (Enter): Open the file under the cursor.
-- -: Toggle file collapse/stage state depending on context.
-- s: Stage/unstage the selected file.
-- S: Stage/unstage all files.

-- gf Open the local version of the file in a different tabpage.
-- <C-w><C-f>              Open the local version of the file in a new split.
-- <C-w>gf                 Open the local version of the file in a new tabpage.
-- <leader>b               Toggle the file panel.
-- <leader>e               Bring focus to the file panel.

-- Compare current branch with main/master:
-- :DiffviewOpen main
-- Compare working tree with a base branch:
-- :DiffviewOpen origin/main
-- Compare two specific branches:
-- :DiffviewOpen branch1..branch2
--

    {
      -- "<leader>gd",
      "<leader>vd",
      function()
        toggle_diffview("DiffviewOpen")
      end,
      desc = "Diff Index",
    },
    {
      -- "<leader>gD",
      "<leader>vD",
      function()
        toggle_diffview("DiffviewOpen main..HEAD")
      end,
      desc = "Diff main",
    },
    {
      -- "<leader>gf",
      "<leader>vh",
      function()
        toggle_diffview("DiffviewFileHistory %")
      end,
      desc = "Open diffs for current File",
    },
  },

  opts = {
    view = {
      default = {
        disable_diagnostics = true,
      },
      merge_tool = {
        layout = 'diff3_mixed',
      },
    },
    enhanced_diff_hl = true,
    hooks = {
      diff_buf_win_enter = function(bufnr, winid, _)
        -- Turn off cursor line for diffview windows because of BG conflict
        -- setting gross underline:
        -- https://github.com/neovim/neovim/issues/9800
        vim.wo[winid].culopt = 'number'

        -- clear the lsp autocmd that highlights the word under the cursor
        pcall(vim.api.nvim_clear_autocmds, {
          group = 'kickstart-lsp-highlight',
          buffer = bufnr,
        })

        -- turn off gitsigns inline diff
        ---@diagnostic disable-next-line: param-type-mismatch
        pcall(vim.cmd, 'Gitsigns toggle_linehl false')
        ---@diagnostic disable-next-line: param-type-mismatch
        pcall(vim.cmd, 'Gitsigns toggle_word_diff false')

        -- clear highlights
        vim.cmd('nohl')

        -- set wrap
        vim.wo[winid].wrap = true
        vim.wo[winid].relativenumber = false

        -- HACK: turn off inlay hints, but diffview is triggering the lsp
        -- to renable them even if they were off (re-editing the buffer?)
        -- add a 100ms delay to make sure they're off. gross.
        vim.defer_fn(function()
          local wins = vim.api.nvim_tabpage_list_wins(0)
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            vim.lsp.inlay_hint.enable(false, { bufnr = buf })
          end
        end, 500)
      end,

      -- -- disable ts context while in diffview
      -- view_enter = function(_)
      --   local ok, ts_context = pcall(require, 'treesitter-context')
      --   if ok and ts_context then ts_context.disable() end
      --   -- vim.cmd('Sidekick nes disable')
      --   vim.g.sidekick_nes = false
      -- end,
      -- view_leave = function(_)
      --   local ok, ts_context = pcall(require, 'treesitter-context')
      --   if ok and ts_context then ts_context.enable() end
      --   vim.g.sidekick_nes = true
      --   -- vim.cmd('Sidekick nes enable')
      -- end,
    },
  },
}
