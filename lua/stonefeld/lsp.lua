-- ---------- LSP ---------- --
-- Import lspconfig module.
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Run 'npm i -g bash-language-server'
lspconfig.bashls.setup { }

-- Run 'npm i -g vim-language-server'.
lspconfig.vimls.setup { }

-- Run 'pip3 install python-language-server[all]'.
lspconfig.pyls.setup {
    capabilities = capabilities,
}

-- Install 'clang' with your package manager.
lspconfig.clangd.setup { }

-- Run 'npm i -g typescript typescript-language-server'.
lspconfig.tsserver.setup { }

-- Run 'npm i -g vscode-html-languagueserver-bin'.
local html_root_path = '/usr/bin/html-languageserver'
lspconfig.html.setup {
    capabilities = capabilities,
    cmd = {html_root_path, '--stdio'},
}

-- Run 'npm i -g vscode-css-languagueserver-bin'.
local css_root_path = '/usr/bin/css-languageserver'
lspconfig.cssls.setup {
    capabilities = capabilities,
    cmd = {css_root_path, '--stdio'},
}

-- Run 'npm i -g vscode-json-languagueserver-bin'.
local json_root_path = '/usr/bin/json-languageserver'
lspconfig.jsonls.setup {
    capabilities = capabilities,
    cmd = {json_root_path, '--stdio'},
}

-- Run 'pip install cmake-language-server'.
lspconfig.cmake.setup { }

-- Install 'texlab' in your system.
lspconfig.texlab.setup { }

-- Install 'rust' in yout system.
lspconfig.rls.setup { }
