return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettier", "prettierd" } },
        typescript = { { "prettier", "prettierd" } },
        javascriptreact = { { "prettier", "prettierd" } },
        typescriptreact = { { "prettier", "prettierd" } },
        vue = { { "prettier", "prettierd" } },
        html = { { "prettier", "prettierd" } },
        css = { { "prettier", "prettierd" } },
        json = { { "prettier", "prettierd" } },
        markdown = { { "prettier", "prettierd" } },
        yaml = { { "prettier", "prettierd" } },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
        quiet = true,
      },
    })

    vim.keymap.set({ "n", "v" }, "<F3>", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
        quiet = true,
      })
    end)
  end,
}
