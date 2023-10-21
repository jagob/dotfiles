local null_ls = require("null-ls")

-- write without auto-formatting
-- :noautocmd w
-- :noa w
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    debug = true,
    sources = {
        null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.flake8.with({
        --     cwd = function(params)
        --         return vim.fn.fnamemodify(params.bufname, ':h')
        --     end
        -- })
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        -- require("null-ls").builtins.diagnostics.flake8.with({extra_args = {"--max-line-length","100"}})
        -- require("null-ls").builtins.formatting.black,
        null_ls.builtins.formatting.black.with(
                -- {extra_args = {"--skip-string-normalization", "--line-length=79"}}),
                {extra_args = {"--skip-string-normalization", "--line-length=88"}}),
        null_ls.builtins.formatting.isort,
        -- require("null-ls").builtins.formatting.yapf,
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.code_actions.eslint,
        -- null_ls.builtins.formatting.prettierd- require("null-ls").builtins.completion.spell,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
