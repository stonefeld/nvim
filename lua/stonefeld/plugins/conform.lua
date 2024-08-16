return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    local u = require("stonefeld.core.utils")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        go = { "gofmt" },
      },
    })

    u.nmap("<leader>fm", function()
      conform.format({ async = true, lsp_format = "fallback" })
    end, "[Conform] Format buffer")

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
