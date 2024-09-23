return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc or "" })
        end

        map("gd", vim.lsp.buf.definition, "[LSP] Goto Definition")
        map("gD", vim.lsp.buf.declaration, "[LSP] Goto Declaration")
        map("gI", vim.lsp.buf.implementation, "[LSP] Goto Implementation")
        map("gr", vim.lsp.buf.references, "[LSP] Goto Implementation")

        map("<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "[LSP] Code Action")

        map("K", vim.lsp.buf.hover, "[LSP] Kind (Hover documentation)")

        -- enable inlay hints
        vim.lsp.inlay_hint.enable()
      end,
    })

    local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋽" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({ virtual_text = false })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local ensure_installed = {
      -- lsp
      "lua_ls",
      "clangd",
      "pylsp",
      "ts_ls",
      "eslint",
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
