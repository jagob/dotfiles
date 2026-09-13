return {
    "mason-org/mason.nvim",
    lazy = false,
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_enable = false,
            ensure_installed = {
                "clangd",
                "lua_ls",
                "jsonls",
                "yamlls",
                "pyrefly",
                -- "pyright",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "black",        -- python linter
                "clang-format", -- c++ formatter
                "isort",        -- python formatter
                "prettier",
                "stylua",       -- Used to format Lua code
            },
        })
    end,
}
