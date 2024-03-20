return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  config = function()
    local none_ls = require("null-ls")

    local f = none_ls.builtins.formatting
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    none_ls.setup({
      sources = {
        f.clang_format,
        f.isort,
        f.black,
        f.stylua,
        f.prettierd,
        f.gofmt,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
