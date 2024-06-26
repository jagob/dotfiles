-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
    debug = true,
    sources = {
        require("null-ls").builtins.diagnostics.flake8,
        -- require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.black.with(
                {extra_args = {"--skip-string-normalization", "--line-length=79"}}),
        require("null-ls").builtins.formatting.isort,
        -- require("null-ls").builtins.formatting.yapf,
        -- require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
    },
})
