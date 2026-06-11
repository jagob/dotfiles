return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.comment").setup({
        -- mappings = {
        --   -- Toggle comment (like `gcip` - comment inner paragraph) for both
        --   -- Normal and Visual modes
        --   comment = "gc",
        --
        --   -- Toggle comment on current line
        --   comment_line = "gcc",
        --
        --   -- Toggle comment on visual selection
        --   comment_visual = "gc",
        --
        --   -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        --   -- Works also in Visual mode if mapping differs from `comment_visual`
        --   textobject = "gc",
        -- },
      })
      require("mini.pairs").setup()
      -- require("mini.surround").setup()
      require("mini.surround").setup({
        -- override "s" mappings to
        mappings = {
          -- add = "ys",
          delete = "ds",
          find = "",
          find_left = "",
          highlight = "",
          replace = "cs",

          -- Add this only if you don't want to use extended mappings
          suffix_last = "",
          suffix_next = "",
        },
        -- search_method = "cover_or_next",
      })
      require("mini.statusline").setup()
    end,
  },
}
