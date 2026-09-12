return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      -- format_on_save = {
      --   -- These options will be passed to conform.format()
      --   timeout_ms = 500,
      --   lsp_format = "fallback",
      -- },

      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        json = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    })

    -- vim.keymap.set("n", "<leader>f", function()
    --   require("conform").format({ bufnr = 0 })
    -- end)
  end,
}
