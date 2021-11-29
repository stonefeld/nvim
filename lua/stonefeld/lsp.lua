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

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<leader>ld', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<leader>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
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

-- Run 'npm i -g typescript typescript-language-server'.
lspconfig.tsserver.setup {
	on_attach = on_attach,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' }
}

-- Run 'npm i -g vim-language-server'.
lspconfig.vimls.setup {
	on_attach = on_attach,
	filetypes = { 'vim' }
}
