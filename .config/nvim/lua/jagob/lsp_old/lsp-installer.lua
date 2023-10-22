-- local lsp_installer = require("nvim-lsp-installer").setup {}
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("jagob.lsp.handlers").on_attach,
		capabilities = require("jagob.lsp.handlers").capabilities,
	}

	 -- if server.name == "jsonls" then
	 -- 	local jsonls_opts = require("jagob.lsp.settings.jsonls")
	 -- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 -- end

	 if server.name == "pyright" then
	 	local pyright_opts = require("jagob.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)