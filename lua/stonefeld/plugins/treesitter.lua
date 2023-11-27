return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "HiPhish/nvim-ts-rainbow2" },
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
        rainbow = {
          enable = true,
          strategy = require("ts-rainbow").strategy.global,
          disable = { "vue" },
        },
      })
    end,
  },
}
