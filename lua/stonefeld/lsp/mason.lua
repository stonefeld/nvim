-- ---------- Mason ---------- --
-- Make a protected call in case mason is not installed
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = " ",
      package_pending = " ",
      package_uninstalled = " "
    }
  }
})

require("stonefeld.lsp.mason-lspconfig")
