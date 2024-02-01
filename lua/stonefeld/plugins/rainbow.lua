return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local rainbow = require("rainbow-delimiters.setup")

    rainbow.setup({
      query = {
        [""] = "rainbow-delimiters",
        vue = "rainbow-parens",
        tsx = "rainbow-parens",
        html = "rainbow-parens",
      },
    })
  end,
}
