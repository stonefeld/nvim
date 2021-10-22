-- ---------- LSP ---------- --
-- Import lspconfig module.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

-- Run 'npm i -g bash-language-server'
lspconfig.bashls.setup({})

-- Install 'ccls' with your package manager.
lspconfig.ccls.setup({})

-- Run 'pip install cmake-language-server'.
lspconfig.cmake.setup({})

-- Run 'npm i -g vscode-css-languagueserver-bin'.
lspconfig.cssls.setup({
	capabilities = capabilities,
	cmd = {'css-languageserver', '--stdio'},
})

-- Run 'npm i -g vscode-html-languagueserver-bin'.
lspconfig.html.setup({
	capabilities = capabilities,
	cmd = {'html-languageserver', '--stdio'},
})

-- Run 'npm i -g vscode-json-languagueserver-bin'.
lspconfig.jsonls.setup({
	capabilities = capabilities,
	cmd = {'json-languageserver', '--stdio'},
})

-- Run 'pip3 install python-language-server[all]'.
lspconfig.pylsp.setup({
	capabilities = capabilities,
	cmd = {'pyls'},
})

-- Install 'rust' in yout system.
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "by_self"
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			}
		}
	}
})

-- Run 'npm i -g typescript typescript-language-server'.
lspconfig.tsserver.setup({})

-- Run 'npm i -g vim-language-server'.
lspconfig.vimls.setup({})
