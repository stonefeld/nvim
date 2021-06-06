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

-- Run 'npm i -g vscode-html-languague-server'.
lspconfig.html.setup {
    capabilities = capabilities,
}

-- Run 'npm i -g vscode-css-languague-server'.
lspconfig.cssls.setup { }

-- Run 'npm i -g vscode-json-languague-server'.
lspconfig.jsonls.setup { }

-- Run 'pip3 install cmake-language-server'.
lspconfig.cmake.setup { }

-- Install 'texlab' with your package manager.
lspconfig.texlab.setup { }

-- Install 'rust' with your package manager.
lspconfig.rls.setup { }
