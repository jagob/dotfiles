return {
  "lmantw/themify.nvim",

  lazy = false,
  priority = 999,
  config = function()
    require("themify").setup({
      -- Your list of colorschemes.
      { "folke/tokyonight.nvim", blacklist = { "tokyonight-day" } },
      { "catppuccin/nvim", name = "catppuccin", blacklist = { "catppuccin-latte" } },
      "NTBBloodbath/sweetie.nvim",
      { "rebelot/kanagawa.nvim", blacklist = { "kanagawa-lotus" } },
      { "sho-87/kanagawa-paper.nvim", blacklist = { "kanagawa-paper-canvas" } },
      {
        "comfysage/evergarden",
        branch = "mega",
        blacklist = { "evergarden-summer" },
      },
      { "rose-pine/neovim", name = "rose-pine", blacklist = { "rose-pine-dawn" } },
      "eldritch-theme/eldritch.nvim",
      -- "jesseleite/nvim-noirbuddy",
      -- "miikanissi/modus-themes.nvim",
      -- "rockyzhang24/arctic.nvim",
      { "Shatur/neovim-ayu", blacklist = { "ayu-light" } },
      -- "RRethy/base16-nvim",
      "cocopon/iceberg.vim",
      -- "kepano/flexoki-neovim",
      -- "uloco/bluloco.nvim",
      "ricardoraposo/gruvbox-minor.nvim",
      "xero/miasma.nvim",
      "gremble0/yellowbeans.nvim",
      "maxmx03/fluoromachine.nvim",
      "ntk148v/komau.vim",
      "savq/melange-nvim",
      "Mofiqul/dracula.nvim",
      "ellisonleao/gruvbox.nvim",
      "bluz71/vim-nightfly-colors",
      -- Built-in colorschemes are also supported.
      -- (Also works with any colorschemes that are installed via other plugin manager, just make sure the colorscheme is loaded before Themify is loaded.)
      "default",
    })
  end,
}
