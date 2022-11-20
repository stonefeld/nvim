-- ---------- Mason Lspconfig ---------- --
-- Make a protected call in case mason-lspconfig is not installed
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local handlers = require("stonefeld.lsp.handlers")

mason_lspconfig.setup_handlers({
	function(server)
		local opts = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
		}

		if server == "sumneko_lua" then
			local sumneko_opts = require("stonefeld.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		if server == "jdtls" then
			local jdtls_opts = require("stonefeld.lsp.settings.jdtls")
			opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
		end

		require("lspconfig")[server].setup(opts)
	end,
})
