return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    vim.diagnostic.config({
      severity_sort = true,
      update_in_insert = false,
      float = {
        border = "rounded",
        source = "if_many",
      },
      underline = true,
      virtual_text = {
        prefix = "",
        spacing = 8,
      },
      signs = {
        linehl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
          [vim.diagnostic.severity.WARN] = "DiagnosticWarnLn",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfoLn",
          [vim.diagnostic.severity.HINT] = "DiagnosticHintLn",
        },
      },
    })

    local hover = vim.lsp.buf.hover
    local signature_help = vim.lsp.buf.signature_help

    vim.lsp.buf.hover = function()
      return hover({
        max_width = 100,
        max_height = 14,
        border = "rounded",
      })
    end

    vim.lsp.buf.signature_help = function()
      return signature_help({
        max_width = 100,
        max_height = 14,
        border = "rounded",
      })
    end

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lsp
        "basedpyright",
        "clangd",
        "cssls",
        "emmet_ls",
        "html",
        "lua_ls",
        "lua_ls",
        "ruff",
        "vtsls",
        "vue_ls",
        -- formatters
        "black",
        "clang-format",
        "isort",
        "prettier",
        "stylua",
      },
    })
  end,
}
