local ts_ok, ts = pcall(require, "nvim-treesitter.configs")
if not ts_ok then
  return
end

ts.setup({
  ensure_installed = {
    "c",
    "cpp",
    "help",
    "javascript",
    "lua",
    "python",
    "rust",
    "tsx",
    "typescript",
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = false },
})
