return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "HiPhish/rainbow-delimiters.nvim" },
    { "windwp/nvim-ts-autotag" },
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
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
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "htmldjango", "dart" },
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
