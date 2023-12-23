return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "HiPhish/rainbow-delimiters.nvim" },
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      local rainbow = require("rainbow-delimiters.setup")

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
      })

      rainbow.setup({
        query = {
          [""] = "rainbow-delimiters",
          vue = "rainbow-parens",
        },
      })
    end,
  },
}
