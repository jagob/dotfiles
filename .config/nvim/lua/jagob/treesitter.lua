vim.defer_fn(function()
  local configs = require("nvim-treesitter.configs")
  configs.setup {
    ensure_installed = { "c", "lua", "python", "bash" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = false,

    highlight = {
      enable = true, -- false will disable the whole extension
      additional_vim_regex_highlighting = true,
    },

    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
  }
end, 0)
