-- ---------- LSP ---------- --
-- Import lspconfig module.
local lspconfig = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Configure the callback function when a language server was attached.
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>', opts)
end

capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits'
	}
}

-- Run 'npm i -g bash-language-server'
lspconfig.bashls.setup {
	on_attach = on_attach,
	filetypes = { 'bash', 'zsh', 'fish', 'sh' }
}

-- Install 'clang' with your package manager.
lspconfig.clangd.setup {
	on_attach = on_attach,
	filetypes = { 'c', 'cpp' }
}

-- Run 'pip install cmake-language-server'.
lspconfig.cmake.setup {
	on_attach = on_attach,
	filetypes = { 'cmake' }
}

-- Run 'npm i -g vscode-css-languagueserver-bin'.
lspconfig.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'css', 'scss' },
	cmd = { 'css-languageserver', '--stdio' }
}

-- Run 'npm i -g vscode-html-languagueserver-bin'.
lspconfig.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'html', 'htmldjango' },
	cmd = { 'html-languageserver', '--stdio' }
}

-- Run 'pip3 install python-language-server[all]'.
lspconfig.pylsp.setup {
	on_attach = on_attach,
	filetypes = { 'python' },
	cmd = { 'pyls' }
}

-- Install 'rust-analyzer' with your package manager.
lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	filetypes = { 'rust' },
	settings = {
		["rust-analyzer"] = {
			assist = {
				importMergeBehavior = "last",
				importPrefix = "by_self",
			},
			diagnostics = {
				disabled = { "unresolved-import" }
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			},
			checkOnSave = {
				command = "clippy"
			},
		}
	}
}

-- Install 'lua-language-server' with your package manager.
lspconfig.sumneko_lua.setup {
	on_attach = on_attach,
	filetypes = { 'lua' }
}

-- Run 'npm i -g typescript typescript-language-server'.
lspconfig.tsserver.setup {
	on_attach = on_attach,
	filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' }
}

-- Run 'npm i -g vim-language-server'.
lspconfig.vimls.setup {
	on_attach = on_attach,
	filetypes = { 'vim' }
}
