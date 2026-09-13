return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "j-hui/fidget.nvim", opts = {} }, -- Useful status updates for LSP.
    },
    config = function()
        -- NOTE: LSP Custom Keybinds
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(event)
                -- Buffer local mappings
                local opts = { buffer = event.buf, silent = true }

                -- Keymaps
                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                -- vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

                opts.desc = "Smart rename"
                -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
                -- vim.keymap.set("n", "<leader>D", function() require("snacks").picker.diagnostics_buffer() end, opts)

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)

                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Show LSP workspace symbols"
                vim.keymap.set("n", "<leader>cw", function() vim.lsp.buf.workspace_symbol() end, opts)

                opts.desc = "Show LSP dynamic workspace symbols"
                vim.keymap.set("n", "<leader>dw", function() vim.lsp.buf.lsp_dynamic_workspace_symbols() end, opts)
                -- map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

                opts.desc = "Show LSP document symbols"
                vim.keymap.set("n", "<leader>cd", function() vim.lsp.buf.document_symbol() end, opts)
                -- map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

                opts.desc = "Show signature help"
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end,
        })

        -- NOTE: Diagnostic Setup
        local signs = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            -- [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
            -- [vim.diagnostic.severity.HINT] = " ",
            -- [vim.diagnostic.severity.ERROR] = "󰅚 ",
            -- [vim.diagnostic.severity.WARN] = "󰀪 ",
            -- [vim.diagnostic.severity.INFO] = "󰋽 ",
        }
        -- update diagnostic config function
        vim.diagnostic.config({
            signs = { text = signs },
            virtual_text = true,
            underline = true,
            update_in_insert = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
            },
        })

        -- toggle for virtual text
        vim.keymap.set("n", "<leader>lx", function()
            local current = vim.diagnostic.config().virtual_text
            vim.diagnostic.config({ virtual_text = not current })
        end, { desc = "Toggle LSP virtual text" })

        -- Setup servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- blink cmp
        capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

        -- Global LSP settings (applied to all servers)
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Configure and enable LSP servers
        -- lua_ls
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- Instead of using mason enable all configured LSP via `automatic_enable=true`
        -- Prefer more control by enable manual server call below via vim.lsp.enable("")
        vim.lsp.enable({
            "clangd",
            "lua_ls",
            "pyrefly",
        })
    end,
}
