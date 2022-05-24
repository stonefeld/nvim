-- ---------- LSP Installer ---------- --
-- Make a protected call in case nvim-lsp-installer is not installed
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "󰄳 ",
      server_pending = "󰁖 ",
      server_uninstalled = "󰅙 "
    },
  },
})

local handlers = require("stonefeld.lsp.handlers")

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("stonefeld.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)
