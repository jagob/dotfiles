return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",

    opts = {
        ensure_installed = { "bash", "c", "diff", "lua", "luadoc", "markdown", "markdown_inline", "vim", "vimdoc" },
        auto_install = true,
        highlight = {
            enable = true,
            -- -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            -- --  If you are experiencing weird indenting issues, add the language to
            -- --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            -- additional_vim_regex_highlighting = { 'ruby' },
            -- },
            -- indent = { enable = true, disable = { 'ruby' } },
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                -- init_selection = "gnn", -- set to `false` to disable one of the mappings
                -- node_incremental = "grn",
                -- scope_incremental = "grc",
                -- node_decremental = "grm",
                init_selection = "<Enter>", -- set to `false` to disable one of the mappings
                node_incremental = "<Enter>",
                scope_incremental = false,
                node_decremental = "<Backspace>",
            },
        },

        indent = {
            enable = true,
        },
    },
}
