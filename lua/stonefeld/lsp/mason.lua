-- ---------- Mason ---------- --
-- Make a protected call in case mason is not installed
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

-- change some default ui options
mason.setup({
	ui = {
		icons = {
			package_installed = " ",
			package_pending = " ",
			package_uninstalled = " ",
		},
	},
})

local masonlsp_ok, masonlsp = pcall(require, "mason-lspconfig")
if masonlsp_ok then
	local handlers = require("stonefeld.lsp.handlers")

	-- autoconfigure the installed lsp servers
	masonlsp.setup_handlers({
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
end
