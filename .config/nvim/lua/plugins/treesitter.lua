return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup {
            -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
            -- Defaults to ~/.local/share/nvim/site
            install_dir = vim.fn.stdpath('data') .. '/site'
        }

        require('nvim-treesitter').install {
            "bash",
            "c",
            "cmake",
            "comment",
            "cpp",
            "csv",
            "diff",
            "dockerfile",
            "git_config",
            "gitignore",
            "json",
            "lua",
            "luadoc",
            "make",
            "markdown",
            "markdown_inline",
            "ninja",
            "nix",
            "python",
            "rust",
            "toml",
            "typst",
            "vim",
            "vimdoc",
            "yaml",
        }

        vim.api.nvim_create_autocmd('FileType', {
          pattern = { '<filetype>' },
          callback = function()
             -- syntax highlighting
             vim.treesitter.start()

             -- -- indentation, provided by nvim-treesitter
             -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end,
        })

    end,
}

