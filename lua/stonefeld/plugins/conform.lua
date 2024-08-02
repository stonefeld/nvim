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
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        go = { "gofmt" },
      },
    })

    u.nmap("<leader>fm", function()
      conform.format({ async = true, lsp_format = "fallback" })
    end, "[Conform] Format buffer")

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
