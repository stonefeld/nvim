-- ---------- LSP ---------- --
-- Make a protected call in case lspconfig is not installed
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
