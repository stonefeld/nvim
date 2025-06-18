return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    local function get_hl_bg(name)
      local hl = vim.api.nvim_get_hl(0, { name = name })
      return hl and hl.bg
    end

    local error_bg = get_hl_bg("DiagnosticVirtualTextError")
    local warn_bg = get_hl_bg("DiagnosticVirtualTextWarn")
    local info_bg = get_hl_bg("DiagnosticVirtualTextInfo")
    local hint_bg = get_hl_bg("DiagnosticVirtualTextHint")

    vim.api.nvim_set_hl(0, "DiagnosticErrorLn", { bg = error_bg, fg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticWarnLn", { bg = warn_bg, fg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticInfoLn", { bg = info_bg, fg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticHintLn", { bg = hint_bg, fg = "NONE" })

    vim.diagnostic.config({
      signs = {
        -- text = {
        --   -- [vim.diagnostic.severity.ERROR] = "󰅚",
        --   -- [vim.diagnostic.severity.WARN] = "󰀪",
        --   -- [vim.diagnostic.severity.INFO] = "󰋽",
        --   -- [vim.diagnostic.severity.HINT] = "󰌶",
        --   [vim.diagnostic.severity.ERROR] = "● ",
        --   [vim.diagnostic.severity.WARN] = "● ",
        --   [vim.diagnostic.severity.INFO] = "● ",
        --   [vim.diagnostic.severity.HINT] = "● ",
        -- },
        linehl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
          [vim.diagnostic.severity.WARN] = "DiagnosticWarnLn",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfoLn",
          [vim.diagnostic.severity.HINT] = "DiagnosticHintLn",
        },
      },
      underline = false,
      virtual_text = {
        -- prefix = "● ",
        -- prefix = ":",
        prefix = "",
        current_line = true,
        spacing = 8,
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

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local status_ok, blink = pcall(require, "blink.cmp")
    if status_ok then
      capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
    end

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

    local servers = require("mason-lspconfig").get_installed_servers()

    for _, server_name in ipairs(servers) do
      local ok, server = pcall(require, "stonefeld.plugins.lsp." .. server_name)
      server = ok and server or {}
      server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
      vim.lsp.config[server_name] = server
    end

    vim.lsp.enable(servers)
  end,
}
