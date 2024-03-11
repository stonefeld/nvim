return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "windwp/nvim-ts-autotag" },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "javascript",
        "lua",
        "python",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      },
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "htmldjango", "dart" },
      },
      autotag = { enable = true },
    })
  end,
}
