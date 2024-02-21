return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  config = function()
    local none_ls = require("null-ls")

    local f = none_ls.builtins.formatting
    local l = none_ls.builtins.diagnostics

    none_ls.setup({
      sources = {
        -- python
        f.isort,
        f.black,

        -- lua
        f.stylua,

        -- javascript/typescript
        f.prettierd,
        l.eslint_d,
      },
    })

    local none_ls_autogroup = vim.api.nvim_create_augroup("NoneLS", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = none_ls_autogroup,
      callback = function()
        if vim.bo.filetype == "htmldjango" then
          return
        end
        vim.lsp.buf.format()
      end,
    })
  end,
}
