-- ---------- Treesitter ---------- --
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "css", "html", "vim", "latex" },
  highlight = {
    enable = true,
    disable = function(lang, bufnr)
      return lang == "markdown" and vim.api.nvim_buf_line_count(bufnr) > 500
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
}
