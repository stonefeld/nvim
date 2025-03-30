return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚",
          [vim.diagnostic.severity.WARN] = "󰀪",
          [vim.diagnostic.severity.INFO] = "󰋽",
          [vim.diagnostic.severity.HINT] = "󰌶",
        }
      }
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

    local ensure_installed = {
      -- lsp
      "lua_ls",
      "clangd",
      "pylsp",
      "ts_ls",
      "html",
      "cssls",
      "emmet_ls",

      -- formatters
      "stylua",
      "clang-format",
      "black",
      "isort",
      "prettierd",

      -- dap
      "cpptools",
    }

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local ok, server = pcall(require, "stonefeld.plugins.lsp." .. server_name)
          server = ok and server or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
