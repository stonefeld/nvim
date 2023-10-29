return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
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
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
