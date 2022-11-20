-- ---------- LSP Handlers ---------- --
local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		focusable = false,
		max_width = 60,
		min_width = 8,
		max_height = math.floor(vim.o.lines * 0.4),
		min_height = 3,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		focusable = false,
	})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local key = vim.keymap.set
	key("i", "<c-k>", vim.lsp.buf.signature_help, opts)
	key("n", "<c-]>", vim.lsp.buf.definition, opts)
	key("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	key("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	key("n", "<leader>f", vim.lsp.buf.format, opts)
	key("n", "<leader>ld", vim.diagnostic.open_float, opts)
	key("n", "<leader>q", vim.diagnostic.setqflist, opts)
	key("n", "<leader>rn", vim.lsp.buf.rename, opts)
	key("n", "K", vim.lsp.buf.hover, opts)
	key("n", "[d", vim.diagnostic.goto_prev, opts)
	key("n", "]d", vim.diagnostic.goto_next, opts)
	key("n", "gD", vim.lsp.buf.declaration, opts)
	key("n", "gi", vim.lsp.buf.implementation, opts)
	key("n", "gr", vim.lsp.buf.references, opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
