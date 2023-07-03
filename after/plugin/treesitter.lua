local ts_ok, ts = pcall(require, "nvim-treesitter.configs")
if not ts_ok then
  return
end

local opts = {
  ensure_installed = {
    "c",
    "cpp",
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
}

local rb_ok, rb = pcall(require, "ts-rainbow")
if rb_ok then
  opts["rainbow"] = {
    enable = true,
    query = "rainbow-parens",
    strategy = rb.strategy.global,
  }
end

ts.setup(opts)
