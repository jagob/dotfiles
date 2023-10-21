local null_ls = require("null-ls")
-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

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
                {extra_args = {"--skip-string-normalization", "--line-length=100"}}),
        null_ls.builtins.formatting.isort,
        -- require("null-ls").builtins.formatting.yapf,
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.code_actions.eslint,
        -- null_ls.builtins.formatting.prettierd- require("null-ls").builtins.completion.spell,
    },
})


-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local null_ls = require('null-ls')

-- local opts = {
--   sources = {
--     null_ls.builtins.formatting.isort,
--     -- null_ls.builtins.formatting.black,
--     null_ls.builtins.formatting.black.with(
--             -- {extra_args = {"--skip-string-normalization", "--line-length=79"}}),
--             {extra_args = {"--skip-string-normalization", "--line-length=100"}}),
--     null_ls.builtins.diagnostics.flake8,
--     null_ls.builtins.diagnostics.mypy,
--     null_ls.builtins.diagnostics.ruff,
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({
--         group = augroup,
--         buffer = bufnr,
--       })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr })
--         end,
--       })
--     end
--   end,
-- }
-- return opts
