return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = false,
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("rainbow-delimiters.setup").setup({
      query = {
        [""] = "rainbow-delimiters",
        vue = "rainbow-parens",
        tsx = "rainbow-parens",
        html = "rainbow-parens",
        xml = "rainbow-parens",
      },
    })
  end,
}
