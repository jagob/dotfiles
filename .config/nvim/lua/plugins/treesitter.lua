local languages = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "dockerfile",
    "json",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "ninja",
    "nix",
    "python",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ':TSUpdate',
    config = function()
        -- ~/.local/share/nvim/site
        local parser_path = vim.fn.stdpath('data') .. '/site'
        vim.opt.runtimepath:prepend(parser_path)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if lang then
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end,
        })

        if vim.fn.executable "tree-sitter" ~= 1 then
            vim.api.nvim_echo({
                {
                    "tree-sitter CLI not found. Parsers cannot be installed.",
                    "ErrorMsg",
                },
            }, true, {})
            return
        end

        require('nvim-treesitter.install').ensure_installed = languages
    end,
}

